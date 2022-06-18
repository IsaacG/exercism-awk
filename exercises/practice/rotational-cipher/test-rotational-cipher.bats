#!/usr/bin/env bats
load bats-extra

@test "rotate a by 0, same output as input" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run gawk -f rotational-cipher.awk -v distance=0 <<< "a"
    assert_success
    assert_output "a"
}

@test "rotate a by 1" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run gawk -f rotational-cipher.awk -v distance=1 <<< "a"
    assert_success
    assert_output "b"
}

@test "rotate a by 26, same output as input" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run gawk -f rotational-cipher.awk -v distance=26 <<< "a"
    assert_success
    assert_output "a"
}

@test "rotate m by 13" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run gawk -f rotational-cipher.awk -v distance=13 <<< "m"
    assert_success
    assert_output "z"
}

@test "rotate n by 13 with wrap around alphabet" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run gawk -f rotational-cipher.awk -v distance=13 <<< "n"
    assert_success
    assert_output "a"
}

@test "rotate capital letters" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run gawk -f rotational-cipher.awk -v distance=5 <<< "OMG"
    assert_success
    assert_output "TRL"
}

@test "rotate spaces" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run gawk -f rotational-cipher.awk -v distance=5 <<< "O M G"
    assert_success
    assert_output "T R L"
}

@test "rotate numbers" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run gawk -f rotational-cipher.awk -v distance=4 <<< "Testing 1 2 3 testing"
    assert_success
    assert_output "Xiwxmrk 1 2 3 xiwxmrk"
}

@test "rotate punctuation" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run gawk -f rotational-cipher.awk -v distance=21 <<< "Let's eat, Grandma!"
    assert_success
    assert_output "Gzo'n zvo, Bmviyhv!"
}

@test "rotate all letters" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run gawk -f rotational-cipher.awk -v distance=13 <<< "The quick brown fox jumps over the lazy dog."
    assert_success
    assert_output "Gur dhvpx oebja sbk whzcf bire gur ynml qbt."
}
