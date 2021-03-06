#! /usr/bin/env bats
################################################################################
# 01-compile_beamerslides.bats
# Time-stamp: <Sat 2016-11-12 19:00 svarrette>
#
# Bats: Bash Automated Testing System -- https://github.com/sstephenson/bats
# Installation: see README.md and setup_bats.sh
#
# Resources:
# - How to use Bats to test your command line tools:
#            https://blog.engineyard.com/2014/bats-test-command-line-tools
# - Ex of travis-CI integration:
#            https://github.com/duggan/pontoon/blob/master/.travis.yml
# - Another project using bats:
#            https://github.com/ekalinin/envirius/tree/master/tests
################################################################################

load helpers/assertions/all

# Directory holding all slides sources examples
SLIDES_ROOTDIR="$BATS_TEST_DIRNAME/../examples"

# the different flavors proposed as sample slides
SRCDIR_MINIMAL="${SLIDES_ROOTDIR}/minimal"
SRCDIR_MARKDOWN="${SLIDES_ROOTDIR}/markdown"
SRCDIR_ADVANCED="${SLIDES_ROOTDIR}/advanced"

# output PDF normally generated by the successful compilation of the slides
PDF_MINIMAL="${SRCDIR_MINIMAL}/minimal.pdf"
PDF_MARKDOWN="${SRCDIR_MARKDOWN}/markdown.pdf"
PDF_ADVANCED="${SRCDIR_ADVANCED}/advanced.pdf"

print_info() {
    echo "SLIDES_ROOTDIR  = ${SLIDES_ROOTDIR}"
    echo "SRCDIR_MINIMAL  = ${SRCDIR_MINIMAL}"
    echo "SRCDIR_MARKDOWN = ${SRCDIR_MARKDOWN}"
    echo "SRCDIR_ADVANCED = ${SRCDIR_ADVANCED}"
    echo "PDF_MINIMAL     = ${PDF_MINIMAL}"
    echo "PDF_MARKDOWN    = ${PDF_MARKDOWN}"
    echo "PDF_ADVANCED    = ${PDF_ADVANCED}"
}

setup() {
    [ -z "`which pdflatex`" ] && skip || true
    # The below one is a dirty way to detect crappy travis ubuntu/precise
    # environment where the simplest way to install tcolorbox is through
    # tlmgr... unfortunately not present on precise (but in 'texlive-base'
    # starting trusty)
    #[ -z "`which tlmgr`"]     && skip || true
}

@test "preliminary or preventive clean" {
    run make -C ${SLIDES_ROOTDIR} clean
    assert_success
    assert [ ! -f "${PDF_MINIMAL}"  ]
    assert [ ! -f "${PDF_MARKDOWN}" ]
    assert [ ! -f "${PDF_ADVANCED}" ]
}

@test "compile minimal slides" {
    run make -C ${SRCDIR_MINIMAL}
    assert_success
    assert [ -f "${PDF_MINIMAL}" ]
}

@test "compile markdown-based slides (using pandoc)" {
    run make -C ${SRCDIR_MARKDOWN}
    assert_success
    assert [ -f "${PDF_MARKDOWN}" ]
}

@test "compile advanced slides" {
    run make -C ${SRCDIR_ADVANCED}
    assert_success
    assert [ -f "${PDF_ADVANCED}" ]
}
