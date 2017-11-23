	$root_folder = "C:\Data\"


	Write-Host 'list of projects:'
	$list_projects = Get-ChildItem $root_folder -Directory -Name;
	$count = 0;
	$Project_Name = "";


	foreach ($i in $list_projects) {
		$Project_Name = $list_projects[$count];
		Write-Host "   "$count"   " $Project_Name;
		$count = 1 + $count;
	}
	$num_project = Read-Host 'Select project'

	$Project_Name = $list_projects[$num_project];

  
	$count = 0;
	$list_tests = Get-ChildItem ($root_folder + $Project_Name + "\") -Include *.jmx -File -recurse -Name
	foreach ($i in $list_tests) {
		$Test_Name =  $list_tests[$count];
		Write-Host "   "$count"   " $Test_Name.split("\")[0];
		$count = 1 + $count;
	}

	$num_test   = Read-Host 'select mode: '
    $FullPathToTest = $root_folder + $Project_Name + "\" + $list_tests[$num_test];
	$Test_Name  = $list_tests[$num_test].Split("\")[0];
    $UID_Name   = $list_tests[$num_test].Split("\")[1].split(".")[0];
    cls
   	Write-Host 'Project '$Project_Name;
	Write-Host 'Test    '$Test_Name;

	$log_destination = $root_folder + $Project_Name + "\" + $Test_Name + "\" + $UID_Name + "." + (get-date -f 'dd.MM.yyyy..HH.mm.ss') +".log"

    do { $answer = Read-Host "y or n" } 
    until ("y","n" -ccontains $answer)


    cd C:\JMeter\bin
    jmeter.bat -n -t $FullPathToTest -l $log_destination


