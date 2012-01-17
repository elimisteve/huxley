Huxley: Stop wasting your life
==============================

Huxley is a suite of tools to help you fight the infinite distractions
of the internet.


Current Features
----------------

* Blocks well-known time-wasting sites in a browser-independent fashion
  (using /etc/hosts)

* cronjob that re-blocks manually unblocked sites every 20 minutes
  (see cronjobs.txt)

* Run Huxley as a Python, Go, or Bash script


Setup
-----

    sudo bash huxley_setup.sh


TODO
----

* Port Huxley to more programming languages (e.g., Ruby, JavaScript)
  to enable more developers to customize it

* Make Huxley more dynamic (e.g., notice when sites are manually
  unblocked and re-block them with increasing frequency)

* Use (supervised) machine learning to turn Huxley into an adaptive
  system
