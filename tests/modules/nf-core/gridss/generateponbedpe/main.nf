#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
include { GRIDSS_GRIDSS           } from '../../../../../modules/nf-core/gridss/gridss/main.nf'
include { GRIDSS_GENERATEPONBEDPE } from '../../../../../modules/nf-core/gridss/generateponbedpe/main.nf'
include { BWA_INDEX               } from '../../../../../modules/nf-core/bwa/index/main.nf'

workflow test_gridss_generateponbedpe {

    input = [
        [ id:'test' ], // meta map
        file(params.test_data['homo_sapiens']['illumina']['test_paired_end_sorted_bam'], checkIfExists: true),
        []
    ]
    fasta = [[id:'fasta'],file(params.test_data['homo_sapiens']['genome']['genome_fasta'], checkIfExists: true)]
    fasta_fai = [[id:'fasta_fai'],file(params.test_data['homo_sapiens']['genome']['genome_fasta_fai'], checkIfExists: true)]

    BWA_INDEX( fasta )
    GRIDSS_GRIDSS( input, fasta, fasta_fai, BWA_INDEX.out.index  )
    GRIDSS_GENERATEPONBEDPE ( GRIDSS_GRIDSS.out.vcf, [[],[]], [[],[]], fasta, fasta_fai, BWA_INDEX.out.index )
}
