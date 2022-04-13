
proc vunit_help {} {
    puts {List of VUnit commands:}
    puts {vunit_help}
    puts {  - Prints this help}
    puts {vunit_load [vsim_extra_args]}
    puts {  - Load design with correct generics for the test}
    puts {  - Optional first argument are passed as extra flags to vsim}
    puts {vunit_user_init}
    puts {  - Re-runs the user defined init file}
    puts {vunit_run}
    puts {  - Run test, must do vunit_load first}
    puts {vunit_compile}
    puts {  - Recompiles the source files}
    puts {vunit_restart}
    puts {  - Recompiles the source files}
    puts {  - and re-runs the simulation if the compile was successful}
}

proc vunit_run {} {
    if {[catch {_vunit_run} failed_or_err]} {
        echo $failed_or_err
        return true;
    }

    if {![is_test_suite_done]} {
        echo
        echo "Test Run Failed!"
        echo
        _vunit_run_failure;
        return true;
    }

    return false;
}

proc _vunit_source_init_files_after_load {} {
    return 0
}
proc _vunit_source_init_files_before_run {} {
    return 0
}

proc vunit_load {{vsim_extra_args ""}} {
    set vsim_failed [catch {
        eval vsim ${vsim_extra_args} {-modelsimini /home/gustavoeso/Documents/insper/trancando/elementos/Z01.1-Boolean/Projetos/B-LogicaCombinacional/vunit_out/modelsim/modelsim.ini -wlf {/home/gustavoeso/Documents/insper/trancando/elementos/Z01.1-Boolean/Projetos/B-LogicaCombinacional/vunit_out/test_output/lib.tb_and16.all_67f8b0b4b21d5bd0e4aa37b46d244e59c8104249/modelsim/vsim.wlf} -quiet -t ps -onfinish stop  -g/tb_and16/runner_cfg={"active python runner : true,enabled_test_cases : ,output path : /home/gustavoeso/Documents/insper/trancando/elementos/Z01.1-Boolean/Projetos/B-LogicaCombinacional/vunit_out/test_output/lib.tb_and16.all_67f8b0b4b21d5bd0e4aa37b46d244e59c8104249/,tb path : /home/gustavoeso/Documents/insper/trancando/elementos/Z01.1-Boolean/Projetos/B-LogicaCombinacional/testes/,use_color : true"} lib.tb_and16(tb)   -L vunit_lib -L lib}
    }]

    if {${vsim_failed}} {
       echo Command 'vsim ${vsim_extra_args} -modelsimini /home/gustavoeso/Documents/insper/trancando/elementos/Z01.1-Boolean/Projetos/B-LogicaCombinacional/vunit_out/modelsim/modelsim.ini -wlf {/home/gustavoeso/Documents/insper/trancando/elementos/Z01.1-Boolean/Projetos/B-LogicaCombinacional/vunit_out/test_output/lib.tb_and16.all_67f8b0b4b21d5bd0e4aa37b46d244e59c8104249/modelsim/vsim.wlf} -quiet -t ps -onfinish stop  -g/tb_and16/runner_cfg={"active python runner : true,enabled_test_cases : ,output path : /home/gustavoeso/Documents/insper/trancando/elementos/Z01.1-Boolean/Projetos/B-LogicaCombinacional/vunit_out/test_output/lib.tb_and16.all_67f8b0b4b21d5bd0e4aa37b46d244e59c8104249/,tb path : /home/gustavoeso/Documents/insper/trancando/elementos/Z01.1-Boolean/Projetos/B-LogicaCombinacional/testes/,use_color : true"} lib.tb_and16(tb)   -L vunit_lib -L lib' failed
       echo Bad flag from vsim_extra_args?
       return true
    }

    if {[_vunit_source_init_files_after_load]} {
        return true
    }

    global BreakOnAssertion
    set BreakOnAssertion 2

    global NumericStdNoWarnings
    set NumericStdNoWarnings 0

    global StdArithNoWarnings
    set StdArithNoWarnings 0

    
    return false
}

proc is_test_suite_done {} {
    set fd [open "/home/gustavoeso/Documents/insper/trancando/elementos/Z01.1-Boolean/Projetos/B-LogicaCombinacional/vunit_out/test_output/lib.tb_and16.all_67f8b0b4b21d5bd0e4aa37b46d244e59c8104249/vunit_results" "r"]
    set contents [read $fd]
    close $fd
    set lines [split $contents "
"]
    foreach line $lines {
        if {$line=="test_suite_done"} {
           return true;
        }
    }

    return false;
}


proc _vunit_run_failure {} {
    catch {
        # tb command can fail when error comes from pli
        echo "Stack trace result from 'tb' command"
        echo [tb]
        echo
        echo "Surrounding code from 'see' command"
        echo [see]
    }
}

proc _vunit_run {} {
    if {[_vunit_source_init_files_before_run]} {
        return true
    }

    proc on_break {} {
        resume
    }
    onbreak {on_break}

    run -all
}

proc _vunit_sim_restart {} {
    restart -f
}

proc vunit_compile {} {
    set cmd_show {/usr/bin/python3 -u ./testeLogicaCombinacional.py --compile}
    puts "Re-compiling using command ${cmd_show}"

    set chan [open |[list {/usr/bin/python3} {-u} {-c} {import sys;import subprocess;exit(subprocess.call(['/usr/bin/python3', '-u', './testeLogicaCombinacional.py', '--compile'], cwd='/home/gustavoeso/Documents/insper/trancando/elementos/Z01.1-Boolean/Projetos/B-LogicaCombinacional', bufsize=0, universal_newlines=True, stdout=sys.stdout, stderr=sys.stdout))}] r]

    while {[gets $chan line] >= 0} {
        puts $line
    }

    if {[catch {close $chan} error_msg]} {
        puts "Re-compile failed"
        puts ${error_msg}
        return true
    } else {
        puts "Re-compile finished"
        return false
    }
}

proc vunit_restart {} {
    if {![vunit_compile]} {
        _vunit_sim_restart
        vunit_run
    }
}
