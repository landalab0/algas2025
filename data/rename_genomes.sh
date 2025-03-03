#!/bin/bash

# Mostrar uso si no se proporcionan los argumentos
usage() {
    echo "Uso: $0 --tsv <archivo.tsv> --in <input_dir> --out <output_dir>"
    exit 1
}

# Variables iniciales
input_tsv=""
input_dir=""
output_dir=""

# Parsear los argumentos
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --tsv) input_tsv="$2"; shift ;;
        --in) input_dir="$2"; shift ;;
        --out) output_dir="$2"; shift ;;
        *) echo "Argumento desconocido: $1"; usage ;;
    esac
    shift
done

# Verificar que todos los argumentos requeridos están presentes
if [[ -z "$input_tsv" || -z "$input_dir" || -z "$output_dir" ]]; then
    echo "Error: Faltan argumentos."
    usage
fi

# Crear el directorio de salida si no existe
mkdir -p "$output_dir"

# Procesar cada línea del archivo TSV
while IFS=$'\t' read -r genome_id taxonomic_name; do
    # Construir el patrón de búsqueda relajado usando solo el ID antes del primer punto
    genome_base=$(echo "$genome_id" | cut -d '.' -f 1)
    original_file=$(find "$input_dir" -type f -name "${genome_base}*" -print -quit)

    # Revisar si el archivo original existe
    if [[ -f "$original_file" ]]; then
        # Reemplazar espacios y caracteres no válidos en el nombre taxonómico
        sanitized_taxonomic_name=$(echo "$taxonomic_name" | tr ' ' '_')   ## | tr -d '[:punct:]')

        # Construir el nuevo nombre del archivo
        new_name="${sanitized_taxonomic_name}_${genome_id}.fasta"

        # Copiar el archivo con el nuevo nombre al directorio de salida
        cp "$original_file" "$output_dir/$new_name"
        echo "Copiado: $original_file -> $output_dir/$new_name"
    else
        echo "Archivo no encontrado para ID: $genome_id"
    fi
done < "$input_tsv"

echo "Proceso completado. Archivos renombrados en $output_dir."

