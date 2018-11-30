# my_module_dir variable define in puppet script

generate_manifest()
{
	local my_common_yaml="${my_module_dir}/site-tpl.pp"
	local _val _tpl

	if [ -f "${my_common_yaml}" ]; then
		local tmp_common_yaml=$( mktemp )
		trap "/bin/rm -f ${tmp_common_yaml}" HUP INT ABRT BUS TERM EXIT
		/bin/cp ${my_common_yaml} ${tmp_common_yaml}
		for i in ${param}; do
			eval _val=\${${i}}
			_tpl="#${i}#"
			sed -i '' -Ees:${_tpl}:${_val}:g ${tmp_common_yaml}
		done
		cat ${tmp_common_yaml}
	else
		for i in ${param}; do
			eval _val=\${${i}}
		cat <<EOF
 $i: "${_val}"
EOF
		done
	fi
}


generate_hieradata()
{
	local my_common_yaml="${my_module_dir}/common.yaml"
	local _val _tpl


	if [ -f "${my_common_yaml}" ]; then
		local tmp_common_yaml=$( mktemp )
		trap "/bin/rm -f ${tmp_common_yaml}" HUP INT ABRT BUS TERM EXIT
		/bin/cp ${my_common_yaml} ${tmp_common_yaml}
		for i in ${param}; do
			eval _val=\${${i}}
			_tpl="#${i}#"
			sed -i '' -Ees:${_tpl}:${_val}:g ${tmp_common_yaml}
		done
		cat ${tmp_common_yaml}
	else
		for i in ${param}; do
			eval _val=\${${i}}
		cat <<EOF
 $i: "${_val}"
EOF
		done
	fi
}
