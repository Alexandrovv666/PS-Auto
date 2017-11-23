	cd C:\JMeter\bin\

	$root_folder = "C:\Data\"
	$Directory = "C:\Data\"
	cls;

#Get list of projects

	Write-Host 'list of projects:'
	$list_projects = Get-ChildItem $Directory -Directory -Name;
	$count = 0;
	$Project_Name = "";
	foreach ($i in $list_projects) {
		$Project_Name = $list_projects[$count];
		Write-Host "   "$count"   " $Project_Name;
		$count = 1 + $count;
	}

	$num_project = Read-Host 'Input number '
	$Project_Name = $list_projects[$num_project];

	$Directory = "" + $root_folder + $Project_Name + "\"


#Get availebe test-plans of the project


	echo $Directory
	$count = 0;
	$list_tests = Get-ChildItem $Directory -Include *.jmx -File -recurse -Name
	foreach ($i in $list_tests) {
		$Test_Name = $Directory + $list_tests[$count];
		Write-Host "   "$count"   " $Test_Name;
		$count = 1 + $count;
	}

	$num_project = Read-Host 'Выберите тест '
	Write-Host 'тест '$Test_Name;



	$directory_destination = $Directory + "\" + (get-date -f 'dd.MM.yyyy') + "\"
	$log_destination = $directory_destination + "log.log"

	if (!(Test-Path $directory_destination)) {
		New-Item -Path $directory_destination -ItemType "Directory"
	}

pause;






































