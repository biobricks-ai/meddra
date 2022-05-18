# The purpose of this script is to convert the files in MedDRA to parquet files.
library(arrow)
library(data.table)
library(tools)
library(dplyr)

# The data does not contain column names. THe column names were manually specified from cache/MedDRA_25_0_English/dist_file_format_25_0_English.pdf. 
# These function add column names to each of the data files and saves the output as parquet files.

processMedDRA_asc <- function(file, path, out) {
	data <- fread(paste0(path, file), sep = "$") |> select_if(~ !any(is.na(.)))

	if(file == "llt.asc")
		colnames(data) = c("llt_code", "llt_name", "pt_code", "llt_currency") 

	else if(file == "hlgt_hlt.asc")
		colnames(data) = c("hlgt_code", "hlt_code")

	else if(file == "hlgt.asc")
		colnames(data) = c("hlgt_code", "hlgt_name")

	else if(file == "hlt_pt.asc")
		colnames(data) = c("hlt_code", "pt_code")
	
	else if(file == "hlt.asc")
		colnames(data) = c("hlt_code", "hlt_name")

	else if(file == "intl_ord.asc") 
		colnames(data) = c("intl_ord_code", "soc_code")

	else if(file == "mdhier.asc") 
		colnames(data) = c("pt_code", "hlt_code", "hlgt_code", "soc_code", "pt_name", "hlt_name", "hlgt_name", "soc_name", "soc_abbrev", "pt_soc_code", "primary_soc_fg")

	else if(file == "meddra_history_english.asc") 
		colnames(data) = c("term_code", "term_name", "term_addition_version", "term_type", "llt_currency", "action")

	else if(file == "meddra_release.asc")
		colnames(data) = c("version", "language")

	else if(file == "pt.asc")
		colnames(data) = c("pt_code", "pt_name", "pt_soc_code")

	else if(file == "smq_content.asc")
		colnames(data) = c("smq_code", "term_code", "term_level", "term_scope", "term_category", "term_weight", "term_status", "term_addition_version", "term_last_modified_version")

	else if(file == "smq_list.asc") 
		colnames(data) = c("smq_code", "smq_name", "smq_level", "smq_description", "smq_source", "smq_note", "MedDRA_version", "status", "smq_algorithm")

	else if(file == "soc_hlgt.asc")
		colnames(data) = c("soc_code", "hlgt_code")

	else if(file == "soc.asc")
		colnames(data) = c("soc_code", "soc_name", "soc_abbrev")

	else {
		print(file)
		print("This file is unexpected and has not been written to parquet.")
		return(0)
	}

	file_name = file_path_sans_ext(file)
	write_parquet(x=data, sink=paste0(out, file_name, "_asc.parquet"))
	return(1)
}

processMedDRA_seq <- function(file, path, out) {
	data <- fread(paste0(path, file), sep = "$") |> select_if(~ !any(is.na(.)))
	if(file == "hlgt_hlt.seq")
		colnames(data) = c("h_h_version_date", "h_h_action_code", "hlgt_code", "hlt_code")

	else if(file == "hlgt.seq")
		colnames(data) = c("hlgt_version_date", "hlgt_action_code", "hlgt_code", "hlgt_name")

	else if(file == "hlt_pt.seq")
		colnames(data) = c("h_p_version_date", "h_p_action_code", "hlt_code", "pt_code")

	else if(file == "hlt.seq")
		colnames(data) = c("hlt_version_date", "hlt_action_code", "hlt_code", "hlt_name")

	else if(file == "intl_ord.seq")
		return(0)

	else if(file == "llt.seq")
		colnames(data) = c("llt_version_date", "llt_action_code", "llt_mod_fld_num", "llt_code", "llt_name", "pt_code", "llt_currency")

	else if(file == "mdhier.seq")
		colnames(data) = c("md_version_date", "md_action_code", "pt_code", "hlt_code", "hlgt_code", "soc_code", "pt_name", "hlt_name", 
			"hlgt_name", "soc_name", "soc_abbrev", "pt_soc_code", "primary_soc_fg")

	else if(file == "pt.seq")
		colnames(data) = c("pt_version_date", "pt_action_code", "pt_code", "pt_name", "pt_soc_code")

	else if(file == "soc_hlgt.seq")
		colnames(data) = c("s_h_version_date", "s_h_action_code", "soc_code", "hlgt_code")

	else if(file == "soc.seq") # this file is empty
		return(0)

	else {
		print(file)
		print("This file is unexpected and has not been written to parquet.")
		return(0)
	}

	file_name = file_path_sans_ext(file)
	write_parquet(x=data, sink=paste0(out, file_name, "_seq.parquet"))
	return(1)
}

# this is the file that was manually reviewed to retrieve the column names specified in the function above 
md5_file_format = md5sum("cache/MedDRA_25_0_English/dist_file_format_25_0_English.pdf") 

# Make parquets from Ascii files 

path_asc = "cache/MedDRA_25_0_English/MedAscii/" # the MedDRA data should be manually downloaded and unzipped
out_asc = "data/asc/"
path_seq = "cache/MedDRA_25_0_English/SeqAscii/"
out_seq = "data/seq/"

{
	if(md5_file_format == "d4a28d6dd4843d0d7ec581a27db01ab4") { # only write to parquet if the file format file is the same one as was manually reviewed 
		files = list.files(path_asc)
		dir.create(out_asc, recursive=TRUE)
		asc_status <- lapply(files, FUN=processMedDRA_asc, path=path_asc, out=out_asc)

		files=list.files(path_seq)
		dir.create(out_seq, recursive=TRUE)
		seq_status <- lapply(files, FUN=processMedDRA_seq, path=path_seq, out=out_seq)
	}
	else 
		print("The version of dist_file_format_25_0_English.pdf that was used to make this script does not match the version that was downloaded. This pdf was used to manually specify column names as the downloaded data does not contain column names. Thus, no parquet files were written.")
}







