> In the late 1990s, the International Council for Harmonisation of Technical Requirements for Pharmaceuticals for Human Use (ICH) developed MedDRA, a rich and highly specific standardised medical terminology to facilitate sharing of regulatory information internationally for medical products used by humans. ICH’s powerful tool, MedDRA is available to all for use in the registration, documentation and safety monitoring of medical products both before and after a product has been authorised for sale. Products covered by the scope of MedDRA include pharmaceuticals, biologics, vaccines and drug-device combination products. Today, its growing use worldwide by regulatory authorities, pharmaceutical companies, clinical research organisations and health care professionals allows better global protection of patient health.

Biobricks.ai transforms MedDRA into parquet files. 

# Data overview 
- This directory contains data obtained from MedDRA. MedDRA is a resource that contains standardized medical terminology.
- The data is stored in parquet format. Descriptions for each column of each file in MedDRA can be found below.
- The data was downloaded from: https://www.meddra.org/user/login?page=%2Fsoftware-packages

# Data Table List 
## Parquets from ASC Files found in `data/asc/`
- `hlgt_hlt_asc.parquet`
- `hlgt_asc.parquet`
- `hlt_pt_asc.parquet`
- `hlt_asc.parquet`
- `intl_ord_asc.parquet`
- `llt_asc.parquet`
- `mdhier_asc.parquet`
- `meddra_history_english_asc.parquet`
- `meddra_release_asc.parquet`
- `pt_asc.parquet`
- `smq_content_asc.parquet`
- `smq_list_asc.parquet`
- `soc_hlgt_asc.parquet`
- `soc_asc.parquet`

## Parquets from SEQ Files found in `data/seq/`
- `hlgt_hlt_seq.parquet`
- `hlgt_seq.parquet`
- `hlt_pt_seq.parquet`
- `hlt_seq.parquet`
- `llt_seq.parquet`
- `mdhier_seq.parquet`
- `pt_seq.parquet`
- `soc_hlgt_seq.parquet`

# Description of Files 
## Parquets from ASC Files found in `data/asc/`
`hlgt_hlt_asc.parquet`
- hlgt_code. 8-digit code to identify the High Level Group Term.
- hlt_code. 8-digit code to identify the High Level Term.

`hlgt_asc.parquet`
- hlgt_code. 8-digit code to identify the High Level Group Term.
- hlgt_name. Full name of the High Level Group Term. 

`hlt_pt_asc.parquet`
- hlt_code. 8-digit code to identify the High Level Term. 
- pt_code. 8-digit code to identify the Preferred Term.

`hlt_asc.parquet`
- hlt_code. 8-digit code to identify the High Level Term. 
- hlt_name. Full name of the High Level Term.

`intl_ord_asc.parquet`
- intl_ord_code. Serial code for international System Organ Class sort order.
- soc_code. 8-digit code to identify the System Organ Class Term.

`llt_asc.parquet`
- llt_code. 8-digit code to identify the Lowest Level Term.
- llt_name. Full name of the Lowest Level Term.
- pt_code. 8-digit code to identify the Preferred Term.
- llt_currency. Indicates whether the Lowest Level Term is current or non-current.

`mdhier_asc.parquet`
- pt_code. 8-digit code to identify the Preferred Term.
- hlt_code. 8-digit code to identify the High Level Term. 
- hlgt_code. 8-digit code to identify the High Level Group Term.
- soc_code. 8-digit code to identify the System Organ Class Term.
- pt_name. Full name of the Preferred Term.
- hlt_name. Full name of the High Level Term. 
- hlgt_name. Full name of the High Level Group Term. 
- soc_name. Full name of the System Organ Class.
- soc_abbrev. System Organ Class abbreviation.
- pt_soc_code. The primary System Organ Class to which the Preferred Term is linked.
- primary_soc_fg. Flag set to Y/N to indicate Primary SOC.

`meddra_history_english_asc.parquet`
- term_code. Subordinate term code; it could be a code for MedDRA PT, LLT, or child SMQ.
- term_name. Full name correspondign to term code.
- term_addition_version. Identifies the version of MedDRA in which this term was added to the SMQ.
- term_type. Type of terrm (eg, PT, HLGT)
- llt_currency. Indicates whether the Lowest Level Term is current or non-current.
- action. The action code. The action code can be either A (Add), U (Update), or D (Delete).

`meddra_release_asc.parquet`
- version. The MedDRA release version.
- language. The language of this download.

`pt_asc.parquet`
- pt_code. 8-digit code to identify the Preferred Term.
- pt_name. Full name of the Preferred Term.
- pt_soc_code. The primary System Organ Class to which the Preferred Term is linked.

`smq_content_asc.parquet`
- smq_code. Eight-digit numeric code assigned to the SMQ, which starts with “2”.
- term_code. Subordinate term code; it could be a code for MedDRA PT, LLT, or child SMQ.
- term_level. MedDRA hierarchy level of the term (4=PT, 5=LLT) or 0 (zero) for a child SMQ.
- term_scope. Defines the MedDRA term as a member of the broad scope (1), narrow scope (2) of the SMQ search, or a child SMQ (0) (zero).
- term_category. The category is assigned a single alphabetical letter depending upon the algorithm applied. If the SMQ does not use algorithms, then all Term_category values are assigned "A." For a child SMQ, this field is assigned "S.”.
- term_weight. Term weight is used for some SMQ algorithms. “0” is used as default.
- term_status. Identifies a term as active within this SMQ or inactive within this SMQ. When a term is added to an SMQ, the value is set to “A” for Active. The term can be flagged as “I” for inactive if the term is no longer used in the SMQ.
- term_addition_version. Identifies the version of MedDRA in which this term was added to the SMQ.
- term_last_modified_version. Identifies the version of MedDRA in which this term was last modified in this SMQ.

`smq_list_asc.parquet`
- smq_code. Eight-digit numeric code assigned to the SMQ, which starts with “2”.
- smq_name. Name for the SMQ, each SMQ carries “(SMQ)” at the end of the name.
- smq_level. Value between 1 and 5 identifying the level of the SMQ within the hierarchy of SMQs; 1 is the most general, 5 is the most narrow.
- smq_description. Description of the SMQ.
- smq_source. Source for the development of the SMQ (e.g., medical references).
- smq_note. Note for users to better understand the scope and development process for the SMQ. The description of the algorithm used is included (if applicable), as well as the definition of categories.
- MedDRA_version. MedDRA version to use in conjunction with this SMQ.
- status. Status of the SMQ. “A” = An active SMQ; “I” = An inactive SMQ.
- smq_algorithm. If the SMQ was developed for use with an algorithm, the Boolean expression of the algorithm is included. “N” if the SMQ does not utilize an algorithm.

`soc_hlgt_asc.parquet`
- soc_code. 8-digit code to identify the System Organ Class Term.
- hlgt_code. 8-digit code to identify the High Level Group Term.

`soc_asc.parquet`
- soc_code. 8-digit code to identify the System Organ Class Term.
- soc_name. Full name of the System Organ Class.
- soc_abbrev. System Organ Class abbreviation.

## Parquets from SEQ Files found in `data/seq/`
`hlgt_hlt_seq.parquet`
- h_h_version_date. Date when MedDRA version was released, dd/mm/yyyy.
- h_h_action_code. Indicates record was added, deleted, or modified.
- hlgt_code. 8-digit code to identify the High Level Group Term.
- hlt_code. 8-digit code to identify the High Level Term. 

`hlgt_seq.parquet`
- hlgt_version_date. Date when MedDRA version was released, dd/mm/yyyy.
- hlgt_action_code. Indicates record was added, deleted, or modified.
- hlgt_code. 8-digit code to identify the High Level Group Term.
- hlgt_name. Full name of the High Level Group Term. 

`hlt_pt_seq.parquet`
- h_p_version_date. Date when MedDRA version was released, dd/mm/yyyy.
- h_p_action_code. Indicates record was added, deleted, or modified.
- hlt_code. 8-digit code to identify the High Level Term. 
- pt_code. 8-digit code to identify the Preferred Term.

`hlt_seq.parquet`
- hlt_version_date. Date when MedDRA version was released, dd/mm/yyyy.
- hlt_action_code. Indicates record was added, deleted, or modified.
- hlt_code. 8-digit code to identify the High Level Term.
- hlt_name. Full name of the High Level Term.

`llt_seq.parquet`
- llt_version_date. Date when MedDRA version was released, dd/mm/yyyy.
- llt_action_code. Indicates record was added, deleted, or modified.
- llt_mod_fld_num. Indicates a field number for each field that is modified when the record contains an "M" in the action field of the record. Records that do not contain "M" in the action field will be left empty.
- llt_code. 8-digit code to identify the Lowest Level Term.
- llt_name. Full name of the Lowest Level Term.
- pt_code. 8-digit code to identify the Preferred Term.
- llt_currency. Indicates whether the Lowest Level Term is current or non-current.

`mdhier_seq.parquet`
- md_version_date. Date when MedDRA version was released, dd/mm/yyyy.
- md_action_code. Indicates record was added, deleted, or modified.
- pt_code. 8-digit code to identify the Preferred Term.
- hlt_code. 8-digit code to identify the High Level Term.
- hlgt_code. 8-digit code to identify the High Level Group Term.
- soc_code. 8-digit code to identify the System Organ Class.
- pt_name. Full name of the Preferred Term.
- hlt_name. Full name of the High Level Term.
- hlgt_name. Full name of the High Level Group Term.
- soc_name. Full name of the System Organ Class.
- soc_abbrev. System Organ Class abbreviation.
- pt_soc_code. The primary System Organ Class to which the Preferred Term is linked.
- primary_soc_fg. Flag set to Y/N to indicate Primary SOC.

`pt_seq.parquet`
- pt_version_date. Date when MedDRA version was released, dd/mm/yyyy.
- pt_action_code. Indicates record was added, deleted, or modified.
- pt_code. 8-digit code to identify the Preferred Term.
- pt_name. Full name of the Preferred Term.
- pt_soc_code. The primary System Organ Class to which the Preferred Term is linked.

`soc_hlgt_seq.parquet`
- s_h_version_date. Date when MedDRA version was released, dd/mm/yyyy.
- s_h_action_code. Indicates record was added, deleted, or modified.
- soc_code. 8-digit code to identify the System Organ Class.
- hlgt_code. 8-digit code to identify the High Level Group Term.