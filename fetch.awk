#!/usr/bin/awk -f


# Awk fetch (kill me)


BEGIN {
  # get kernel stuff..
  g_kern = "uname -rv | awk '{print $1}'"
  while((g_kern | getline result) > 0) print "Kernel: " result
  close(g_kern)
  
  # distro
  g_distro = "lsb_release -a | awk '{print $2 $3}' | grep ID | cut -c4-999"
  while((g_distro | getline res__) > 0) print "Distro: " res__
  close(g_distro)

  # used memory
  g_umem = "free -h | grep Mem: | awk '{print $3}'"
  while((g_umem | getline __res__) > 0) print "FreeM: " __res__
  close(g_umem)
}

