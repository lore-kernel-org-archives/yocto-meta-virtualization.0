Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.214.1593193039739635272
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 26 Jun 2020 10:37:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K+luEdNG;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id w6so10159438ejq.6
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 26 Jun 2020 10:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9dCSaEgaGLTjAt6hmyaOpoBQ9f/rTb/OmHeZbybN0KM=;
        b=K+luEdNGdIr8S+TWm2QptqT+ypbNeg4Vdv1KoYCgzvnVp8n4jii7oKORzi9X8WjUH5
         xjTyZzjWg28g/uhrk7Crky5qvhcYSTLCjdK0hn5A4ZOEieriwdiivRjmwLwPE/E7jGJQ
         bQ/zrJ1jajKAY2gE9I/5q/UA/Hvt7a6qISoWWDugJbWnMwL68FfWU4LFbGr6KuKc6sqB
         nS/RpBcXeLsuMfTGTKhlCXBfJpqZcynT8OJTb9Fxv+tbzibgA4ludWdCxT5u8KIsU5f7
         YrvBDfg+fT9LFFKz5OJZomYzjMMojyjDxQT1wuSk9335DnhLLXrFeEJnrMEMgb2Lb4ux
         EXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9dCSaEgaGLTjAt6hmyaOpoBQ9f/rTb/OmHeZbybN0KM=;
        b=m3PctWpP/bvzHAXIpMXDcasfte6mC4HL5ElK3kLYlFiREDkgpS0bKaKAV2ABSX2xH9
         ckS2iZU2zvwsoIEIfTtRK4qtOESyCtCeZm/C7MA3ym1wlHS3tsYGzTylg9DHoUFWppqJ
         WtVQy9PjSPAXx0yMxHkwttdIWgmTeQvW/VxNcJNP6hS9swkKHlX4Ak3l8Kbw/2tjLNVE
         BgWQEyi4JgGaPh5N5ozfYxQZNc+u2/gUKEGc0MVqxYgFzO9FFOdfuPQmSLgDYBBasOst
         0oACFJhnCk+Xyl4v+9z71Z+FgmqgbuV4vJFZCESTAtCdAPOOQbmKFra+Y+DSPXo73KIL
         /BLw==
X-Gm-Message-State: AOAM533L0tRIe/f4yScYYP9vNSDlXOTXNypT6jv9i0IpJC1WYJQ8QJKh
	gYlRSK9lc9b78r/byPTKyTjonyiVX4m76F2asjg=
X-Google-Smtp-Source: ABdhPJwH9K7klPjUeaczXHKnqkeRHrY1tflFTdPGTcOhgs7qioARlD1i8WvLaH6yEU4i6BahFtlJ26mj5DWSMiWQ4To=
X-Received: by 2002:a17:906:5283:: with SMTP id c3mr3367552ejm.22.1593193038064;
 Fri, 26 Jun 2020 10:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200626161705.32600-1-liu.ming50@gmail.com> <CA+chaQei6WPUNkN0OOkk+MxEsWmnPSkTBAnrUq9KLbXmx87y1g@mail.gmail.com>
In-Reply-To: <CA+chaQei6WPUNkN0OOkk+MxEsWmnPSkTBAnrUq9KLbXmx87y1g@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 26 Jun 2020 13:37:06 -0400
Message-ID: <CADkTA4NUPV9cfXBar-o5ir+v3yi5eXrp-50uO782Bv5CthkEog@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] docker-moby: update to v19.03.12
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Ming Liu <liu.ming50@gmail.com>, ross.burton@arm.com, 
	meta-virtualization@lists.yoctoproject.org, 
	Stefan Agner <stefan.agner@toradex.com>, Ming Liu <ming.liu@toradex.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 26, 2020 at 1:22 PM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> Hi,
>
> docker-moby now fails to build because of go-native changes from Ross (https://git.openembedded.org/openembedded-core/commit/?id=c23f9e80492e4b1d47c0ada8eae3decf736253c7)
>
> ---> Making bundle: dynbinary (in bundles/dynbinary)
> Building: bundles/dynbinary-daemon/dockerd-19.03.8
> GOOS="linux" GOARCH="arm" GOARM="7"
> # net
> In file included from docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/recipe-sysroot/usr/include/gnu/stubs.h:23,
>                  from docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/recipe-sysroot/usr/include/features.h:489,
>                  from docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/recipe-sysroot/usr/include/netdb.h:25,
>                  from ../../../recipe-sysroot-native/usr/lib/go/src/net/cgo_linux.go:10:
> docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/recipe-sysroot/usr/include/gnu/stubs-32.h:7:11: fatal error: gnu/stubs-soft.h: No such file or directory
>     7 | # include <gnu/stubs-soft.h>
>       |           ^~~~~~~~~~~~~~~~~~
> compilation terminated.
> # os/user
> In file included from docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/recipe-sysroot/usr/include/gnu/stubs.h:23,
>                  from docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/recipe-sysroot/usr/include/features.h:489,
>                  from docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/recipe-sysroot/usr/include/unistd.h:25,
>                  from ../../../recipe-sysroot-native/usr/lib/go/src/os/user/cgo_lookup_unix.go:20:
> docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/recipe-sysroot/usr/include/gnu/stubs-32.h:7:11: fatal error: gnu/stubs-soft.h: No such file or directory
>     7 | # include <gnu/stubs-soft.h>
>       |           ^~~~~~~~~~~~~~~~~~
> compilation terminated.
> WARNING: exit code 2 from a shell command.
>
> ERROR: Logfile of failure stored in: docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/temp/log.do_compile.30189
>
> This was shown in raspberrypi4 world build - I'm not using docker built with OE, but maybe it's something which should be fixed either in go-native or in docker recipes.
>
> I've tried a build with this docker upgrade applied and it doesn't help, reverting https://git.openembedded.org/openembedded-core/commit/?id=c23f9e80492e4b1d47c0ada8eae3decf736253c7 still fixes the build.

I was running into this as well, and was looking into it while working
on a few upgrades.

I still don't have a great idea for a fix, but am still looking at his.

Have we reported the issue to Ross/RP or in the yocto bugzilla yet ?
It would be odd if the docker recipes were the only ones seeing this.

Bruce

>
> Regards,
>
> On Fri, Jun 26, 2020 at 6:15 PM Ming Liu <liu.ming50@gmail.com> wrote:
>>
>> From: Ming Liu <ming.liu@toradex.com>
>>
>> Updating to 19.03.12 to pickup bugfixes and security changes. The
>> following commits comprise this update:
>>
>> moby:
>>
>> 9dc6525e61 Merge pull request #41124 from thaJeztah/19.03_bump_libnetwork
>> abb5beffff Merge pull request #41088 from thaJeztah/19.03_backport_invalid_cpu_shares_fix
>> b4ca19a992 vendor: docker/libnetwork 026aabaa659832804b01754aaadd2c0f420c68b6 (bump_19.03 branch)
>> d5a82971a4 Merge pull request #41082 from thaJeztah/19.03_backport_bump_golang_1.13.12
>> 5fce12cf25 int-cli/TestRunInvalidCPUShares: fix for newer runc
>> 058ea43c5c Bump Golang 1.13.12
>> 77e06fda0c vendor libnetwork to 153d0769a1181bf591a9637fd487a541ec7db1e6
>> b47e742558 Merge pull request #41027 from thaJeztah/19.03_bump_criu
>> b85d75e29a Merge pull request #41009 from tiborvass/19.03-fix-dns-fallback-regression
>> c104a50de4 integration: Add TestDaemonDNSFallback
>> 9482566a5c vendor libnetwork to 71d4d82a5ce50453b1121d95544f0a2ae95bef9b
>> d4e12315cd hack: add more debugging to understand exit codepath
>> 4c24512241 Dockerfile: bump CRIU 3.14
>> ad0f0b3970 Merge pull request #40978 from thaJeztah/19.03_backport_bump_golang_1.13.11
>> 29796375c9 Bump Golang 1.13.11
>> c1cc6ec81a Merge pull request #40988 from thaJeztah/19.03_backport_fix_gotestsum_install
>> 8f1ab4e612 Fix bug in gotestsum installer causing dependencies to not be downloaded
>> 811a247d06 Merge pull request #40970 from AkihiroSuda/archive-40939-1903
>> 4d1885fb94 Merge pull request #40964 from AkihiroSuda/rootless-requires-slirp4netns-040-1903
>> 0a3b2bda34 pkg/archive: escape ":" symbol in overlay lowerdir
>> 9057ddf37c dockerd-rootless.sh: bump up slirp4netns requirement to v0.4.0
>> ab567a4327 Merge pull request #40955 from tonistiigi/19.03-buildkit-update
>> ee3f3ece72 Merge pull request #40951 from AkihiroSuda/rootlesskit-095-1903
>> a76633684b vendor: update buildkit to a7d7b7f1
>> 0803200be9 Merge pull request #40946 from thaJeztah/19.03_backport_fix_selinux_enotsup
>> 706008a1da bump up rootlesskit to v0.9.5
>> 57f6c9a0ef SELinux: fix ENOTSUP errors not being detected when relabeling
>> c4c6cf6b6a Merge pull request #40921 from cpuguy83/19.03_log_rotate_error_handling
>> 7d4dd91a52 logfile: Check if log is closed on close error during rotate
>> edf2c49410 vendor: pkg/errors v0.9.1
>> 1adcc64f40 Merge pull request #40877 from thaJeztah/19.03_update_buildkit
>> e7349349fd Merge pull request #40850 from thaJeztah/19.03_backport_criu_3.13
>> 3677003554 Merge pull request #40782 from thaJeztah/19.03_backport_switch_to_s390x_ubuntu_1804
>> 63841af153 [19.03] vendor: buildkit v0.6.4-5-g59e305aa
>> 2fbb374ab7 Merge pull request #40863 from AkihiroSuda/rootlesskit-094-1903
>> 946d0ff67e bump up rootlesskit to v0.9.4
>> 70e7d6fe4a Update CRIU to v3.13 "Silicon Willet"
>> f432f71595 Merge pull request #40563 from thaJeztah/19.03_backport_fix_windows_file_handles
>> 47a6d9b54f Merge pull request #40565 from thaJeztah/19.03_backport_fix_bip_subnet_config
>> 6a0995e0d8 Merge pull request #40831 from thaJeztah/19.03_bump_swarmkit
>> e4f239d68e [19.03] vendor: swarmkit 0b8364e7d08aa0e972241eb59ae981a67a587a0e
>> 25b82fa9b8 Merge pull request #40801 from thaJeztah/19.03_backport_update_go_events
>> e149ff62fe vendor: update go-events to fix alignment for 32bit systems
>> 90a31c4829 Merge pull request #40809 from thaJeztah/19.03_update_libnetwork
>> aa98b4f5d6 Merge pull request #40803 from thaJeztah/19.03_backport_bump_golang_1.13.10
>> 860e7e273d Merge pull request #40800 from thaJeztah/19.03_backport_api_docs_fix_link
>> a58b52b037 Merge pull request #40799 from thaJeztah/19.03_backport_fix_test_filter
>> a6beb24dc5 [19.03] update libnetwork b9bcf0c3fba9ef8897c9676c5b70ba0345b84b17
>> 282567a58d Bump Golang 1.13.10
>> b66813eb45 api docs: fix broken link on GitHub
>> edbb1d9e95 Merge pull request #40784 from thaJeztah/19.03_update_buildkit
>> 9d8eccec8e Fix TEST_FILTER to work for both "integration" and "integration-cli"
>> 4275aec641 Merge pull request #40592 from thaJeztah/19.03_backport_bump_golang_1.13
>> 4b040147cf Merge pull request #40417 from thaJeztah/19.03_backport_test_fixes
>> 08a2fe0d56 [19.03] vendor buildkit b26cff2413cc6a466f8739262efa13bd126f8fc7
>> 1e1caccb13 Merge pull request #40780 from thaJeztah/19.03_backport_map_sync
>> 5ba2bf37a8 Bump Golang 1.13.9
>> f432a04243 Update Golang 1.13.8
>> 81458b3144 Update Golang 1.13.7 (CVE-2020-0601, CVE-2020-7919)
>> 4275aec641 Merge pull request #40592 from thaJeztah/19.03_backport_bump_golang_1.13
>> 4b040147cf Merge pull request #40417 from thaJeztah/19.03_backport_test_fixes
>> 08a2fe0d56 [19.03] vendor buildkit b26cff2413cc6a466f8739262efa13bd126f8fc7
>> 1e1caccb13 Merge pull request #40780 from thaJeztah/19.03_backport_map_sync
>> 5ba2bf37a8 Bump Golang 1.13.9
>> f432a04243 Update Golang 1.13.8
>> 81458b3144 Update Golang 1.13.7 (CVE-2020-0601, CVE-2020-7919)
>> 6e1d159680 Update Golang 1.13.6
>> 4241093b63 Update Golang 1.13.5
>> 162fd8b856 Bump Golang 1.13.4
>> 05a1ebd0fd Bump Golang 1.13.3 (CVE-2019-17596)
>> f8d4276a89 bump golang 1.13.1 (CVE-2019-16276)
>> 7df2d881f3 Bump Golang version 1.13.0
>> fed832e224 Update to using alpine 3.10
>> 4581499848 Switch to s390x Ubuntu 18.04
>> f34a5b5af0 builder: fix concurrent map write
>> 0df114a8f8 Merge pull request #40779 from thaJeztah/19.03_backport_unify_apis
>> 9f5a5da4cb docs: add API versions v1.30 - v1.37
>> 037d5a9e9a Merge pull request #40769 from thaJeztah/19.03_backport_seccomp_time64
>> 5ed8f9a203 Merge pull request #40681 from thaJeztah/19.03_backport_schema2v1_dep_notice_on_error_only
>> 284bbde996 seccomp: add 64-bit time_t syscalls
>> 43b0a73273 Merge pull request #40758 from thaJeztah/19.03_backport_arm_matching
>> 89f296a534 Merge pull request #40562 from thaJeztah/19.03_backport_39353_subgid_subuid
>> d12b6d24d1 Merge pull request #40628 from cpuguy83/19.03_backport_39360_swarm_log_fill_rate
>> 359edd8cbf [19.03] vendor: containerd 481103c8793316c118d9f795cde18060847c370e
>> 1454987253 Merge pull request #40617 from SamWhited/19.03
>> 021258661b Update libnetwork and DNS library
>> 1db5199ddc Merge pull request #40564 from thaJeztah/19.03_backport_apparmor_fixes
>> 6ed0f6ab78 Merge pull request #40652 from thaJeztah/19.03_backport_fix_backingfs
>> 100d240d86 Move schema1 deprecation notice
>> 4a4b3ed37f Merge pull request #40558 from thaJeztah/19.03_backport_buster_or_bust
>> 57d5105759 bump windows-container-utility aa1ba87e99b68e0113bd27ec26c60b88f9d4ccd9
>> 68db0c1739 Dockerfile: switch to iptables-legacy to match the host
>> 4aaf3ead97 Dockerfile: switch golang image to "buster" variant, and update btrfs packages
>> a070874828 hack/make: ignore failure to stop apparmor
>> 237843a059 Dockerfile: align consecutive COPY lines
>> 400b2850ff Dockerfile: order COPY lines by change frequency
>> ddfeaf32ff Dockerfile: sort packages alphabetically
>> cb813faebf Dockerfile: use build-arg for vpnkit
>> 0499db23d1 Dockerfile: use spaces for indentation
>> c77e7cb3d0 [19.03] Dockerfile: move CRIU_VERSION lower
>> c6511ee4db bump vndr v0.1.1
>> 0fa8a0c575 bump vndr v0.1.0 to support versioned import paths
>> f3009e2f51 Use build args to override binary commits in dockerfile
>> 92ca652fc9 Revert "dockerfile: update vndr to 85886e1a"
>> fdad16840c go-swagger: fix panic
>> 075e057de5 Dockerfile: set GO111MODULE=off
>>
>> bnetwork:
>>
>> 026aaba Merge pull request #2567 from thaJeztah/19.03_backport_no_error
>> 8565f0b log error instead if disabling IPv6 router advertisement failed
>> 86d159c Merge pull request #2565 from s0j/s0j_bump_19.03_fix-network-not-found
>> bcb6dd6 Fix 'failed to get network during CreateEndpoint'
>> 153d076 bridge: disable IPv6 router advertisements
>> 71d4d82 Merge pull request #2552 from thaJeztah/19.03_backport_fix_error_handline
>> fdaaa02 Resolver: fix error handling if we didn't receive a response
>> 7cf227c Merge pull request #2517 from thaJeztah/19.03_backport_bump_golang_1.13
>> b9bcf0c Merge pull request #2545 from thaJeztah/19.03_backport_fix_npe_ep_iface
>> b09f24d Fix NPE due to null value returned by ep.Iface()
>> 0941c3f Merge pull request #2541 from SamWhited/19.03_resolver_panic_backport
>> 8068671 Fixes a panic in the DNS resolver
>> 536ae72 Dockerfile: update to Go 1.13.8
>> dcd9528 Fix gofmt in preparation of Go 1.13 update
>> f0b038e regenerate protobufs with debian buster
>> 34c8de5 Dockerfile: switch to debian "buster"
>> 9660011 Dockerfile: update to Golang 1.12.17
>> 026aaba Merge pull request #2567 from thaJeztah/19.03_backport_no_error
>> 8565f0b log error instead if disabling IPv6 router advertisement failed
>> 86d159c Merge pull request #2565 from s0j/s0j_bump_19.03_fix-network-not-found
>> bcb6dd6 Fix 'failed to get network during CreateEndpoint'
>> 153d076 bridge: disable IPv6 router advertisements
>> 71d4d82 Merge pull request #2552 from thaJeztah/19.03_backport_fix_error_handline
>> fdaaa02 Resolver: fix error handling if we didn't receive a response
>> 7cf227c Merge pull request #2517 from thaJeztah/19.03_backport_bump_golang_1.13
>> b9bcf0c Merge pull request #2545 from thaJeztah/19.03_backport_fix_npe_ep_iface
>> b09f24d Fix NPE due to null value returned by ep.Iface()
>> 0941c3f Merge pull request #2541 from SamWhited/19.03_resolver_panic_backport
>> 8068671 Fixes a panic in the DNS resolver
>> 536ae72 Dockerfile: update to Go 1.13.8
>> dcd9528 Fix gofmt in preparation of Go 1.13 update
>> f0b038e regenerate protobufs with debian buster
>> 34c8de5 Dockerfile: switch to debian "buster"
>> 9660011 Dockerfile: update to Golang 1.12.17
>>
>> cli:
>>
>> 0ed913b88 Merge pull request #2592 from thaJeztah/19.03_backport_logout_config_out_of_sync2
>> ab45dc8fd Merge pull request #2591 from thaJeztah/19.03_backport_docs_fixes2
>> 0ed913b88 Merge pull request #2592 from thaJeztah/19.03_backport_logout_config_out_of_sync2
>> ab45dc8fd Merge pull request #2591 from thaJeztah/19.03_backport_docs_fixes2
>> 5a12f90b4 Don't filter out registries to logout from with config file contents
>> 0ed913b88 Merge pull request #2592 from thaJeztah/19.03_backport_logout_config_out_of_sync2
>> ab45dc8fd Merge pull request #2591 from thaJeztah/19.03_backport_docs_fixes2
>> 5a12f90b4 Don't filter out registries to logout from with config file contents
>> 521a636a8 Add MOBY_DISABLE_PIGZ to dockerd environment variable docs
>> 8b8ec04cd Split up environment variable documentation between cli and dockerd
>> 4e7c875e3 Fix broken link
>> 2e6ff15da Merge pull request #2557 from thaJeztah/19.03_backport_fix_plugin_api_link
>> f56d1b364 Merge pull request #2575 from thaJeztah/19.03_backport_bump_golang_1.13.12
>> 8e7ff60ee Merge pull request #2589 from thaJeztah/19.03_backport_bump_x_text
>> 6cb678f16 vendor: golang.org/x/text v0.3.3
>> 4515c5187 vendor: golang.org/x/text v0.3.2
>> 43a4e09bb Merge pull request #2586 from thaJeztah/19.03_backport_context_dont_loose_additional_fields
>> cfa1fd9ac Don't loose additional metadata fields
>> 6051b36db Merge pull request #2570 from thaJeztah/19.03_backport_hardcode_name_in_errors
>> 31d338dd3 Bump Golang 1.13.12
>> 9cc05b9ce Merge pull request #2548 from thaJeztah/19.03_backport_fix_dockerd_api_link
>> 936d328da Use consistent name for errors
>> dd360c7c0 Merge pull request #2558 from tiborvass/19.03-expenv-panic
>> 92b54c256 Merge pull request #2560 from tiborvass/19.03-sshfix
>> 2ee798198 ssh: avoid setting flags through hostname
>> e90b6bcb6 Fix bug with panic when DOCKER_CLI_EXPERIMENTAL environment variable is incorrect
>> 97afb7295 docs/extend: fix broken link and some markdown touch-ups
>> c280cdfd6 docs: fix broken link in dockerd.md
>> fd7874f16 Merge pull request #2532 from thaJeztah/19.03_backport_bump_golang_1.13.11
>> a945f0e7e Merge pull request #2538 from silvin-lubecki/fix-version-old-engine-19-03
>> 0f59532a1 Run e2e tests with different engine version on Jenkins Rewrite Jenkinsfile to new declarative syntax without parallel as the e2e framework is not tailored for than (container name clash, port clash,...)
>> 95df3499b Add a new Makefile variable to override DockerInDocker engine version we use to run e2e tests
>> 2d1476c6f Partially revert cf663b526a34f3e7911e6e60138138c2023aa844 as it breaks the version negotiation with an older docker engine.
>> 936e9717e Bump Golang 1.13.11
>> ab108430b Merge pull request #2520 from thaJeztah/19.03_backport_markup_touch_ups
>> 489c7e9cd docs: more Markdown touch-ups
>> 1705e47cd Merge pull request #2508 from thaJeztah/19.03_backport_config_dont_init
>> a9a83d2e7 Merge pull request #2516 from thaJeztah/19.03_backport_bump_klog
>> ae2012cce Merge pull request #2518 from thaJeztah/19.03_backport_bump_pkg_errors
>> 052a71c4d Merge pull request #2509 from thaJeztah/19.03_backport_docs_fixes
>> 9a57ea886 Update some uses of errors.Cause() to errors.Is()
>> 345b0e79e vendor: pkg/errors v0.9.1
>> 62a9babca vendor: k8s.io/klog v1.0.0-2-g4ad0115
>> dbc73eafc docs: fix, and touch-up "docker context" docs
>> e06fc01c1 Update dead link and add missing info on COPY
>> 8434242c7 config: don't call homedir on init()
>> bef0d567a Merge pull request #2493 from thaJeztah/19.03_backport_update_dockerd_usage
>> 65c37227a docs: update usage output for dockerd (19.03)
>> 55a5ab0f0 docs: fix order of flags in usage, and fix missing quote
>> a2d8a8a4c Merge pull request #2484 from thaJeztah/19.03_backport_fix_builder_link
>> c150ba2b8 builder: fix broken link
>> 392993336 Merge pull request #2457 from thaJeztah/19.03_backport_lazy_feature_detection
>> 62baa3ce5 Merge pull request #2471 from thaJeztah/19.03_backport_fix_bind_panic
>> 7a2de8165 Merge pull request #2470 from thaJeztah/19.03_backport_bump_yaml
>> 0ea509c77 Merge pull request #2481 from thaJeztah/19.03_backport_fix_run_reference_links
>> 81909d70f docs: fix links, and minor markdown touch-ups
>> cf663b526 cli: perform feature detection lazily
>> c44c18e08 docker build: check experimental --platform on pre-run
>> 25f04876d app-214 Load Client info in getter function
>> e470eef36 Merge pull request #2469 from thaJeztah/19.03_backport_docs
>> 4ad65fc35 fix panic on single-character volumes
>> 83d4cb900 vendor: bump gopkg.in/yaml.v2 v2.2.8
>> 0cfe29431 service update: fix service create example
>> 62baa3ce5 Merge pull request #2471 from thaJeztah/19.03_backport_fix_bind_panic
>> 7a2de8165 Merge pull request #2470 from thaJeztah/19.03_backport_bump_yaml
>> 0ea509c77 Merge pull request #2481 from thaJeztah/19.03_backport_fix_run_reference_links
>> 81909d70f docs: fix links, and minor markdown touch-ups
>> cf663b526 cli: perform feature detection lazily
>> c44c18e08 docker build: check experimental --platform on pre-run
>> 25f04876d app-214 Load Client info in getter function
>> e470eef36 Merge pull request #2469 from thaJeztah/19.03_backport_docs
>> 4ad65fc35 fix panic on single-character volumes
>> 83d4cb900 vendor: bump gopkg.in/yaml.v2 v2.2.8
>> 0cfe29431 service update: fix service create example
>> 2dc593f67 Add container_iface_prefix option to documentation
>> d25e65734 Merge pull request #2445 from thaJeztah/19.03_backport_network_prune_improve_message
>> 8986e3120 Merge pull request #2456 from thaJeztah/19.03_backport_gotest_v3
>> 4fe6b837b bump gotest.tools v3.0.1 for compatibility with Go 1.14
>> a8454a4d9 update vndr v0.1.1
>> 950dcedd9 bump vndr v0.1.0 to support versioned import paths
>> 05ad944d1 Merge pull request #2453 from thaJeztah/19.03_backport_fixup_markdown_and_links
>> 0d26cbf5b yamldocs: add description to base command
>> d4e4fa3b4 experimental/vlan-networks: markdown touch-ups
>> de12dbfb1 docs/reference: explain "colon"
>> 7ae77e51f docs/extend: reformat notes
>> 733ae82da docs/builder: touch up markdown, and some minor rephrasing
>> 9a1ba7d39 docs/reference/run.md: touch-up markdown
>> 6ba9a3e4c reference docs: reformat notes
>> 96eb0888f reference docs: fix broken links and markdown touch-ups
>> 2676c603f Adding missing title in builder.md
>> 365bae4f8 Add clarification when using USER UID:GI
>> 04533bd52 Merge pull request #2442 from thaJeztah/19.03_backport_update_go_events
>> c38b26007 improve "network prune" output to mention custom networks only
>> ba0a2ffe2 Merge pull request #2444 from thaJeztah/19.03_backport_host_gateway_validation
>> fd9eedce3 Add "host-gateway" to tests for extra_hosts / --add-host
>> 365118982 Skip IPAddr validation for "host-gateway" string
>> a0f0ed1f5 vendor: update go-events to fix alignment for 32bit systems
>> 173c85ad7 Merge pull request #2431 from thaJeztah/19.03_backport_bump_golang_1.13.10
>> de6a5fa44 Bump Golang 1.13.10
>> 1a4749b8e Merge pull request #2435 from thaJeztah/19.03_backport_bump_certificates
>> 19ccd4f5d CI: update notary test certificates
>> d7f5f70c3 Merge pull request #2419 from thaJeztah/19.03_backport_bump_golang_1.13.9
>> f8fc68f17 Bump Golang 1.13.9
>> 7d4850005 Merge pull request #2403 from thaJeztah/19.03_backport_update_deprecation_policy
>> 22cbf9161 Update deprecation policy to 1 stable release
>> 0b0ea3f0f Merge pull request #2401 from thaJeztah/19.03_backport_deprecation_policy
>> 288cdec29 Include deprecation policy on deprecated features page
>> a4d902af5 Merge pull request #2399 from thaJeztah/19.03_backport_remove_comments
>> ffffc1ed4 remove unneeded comment from reference files
>> bf1f5fcfb Merge pull request #2393 from thaJeztah/19.03_backport_codehints_compatibility
>> c35400655 Merge pull request #2391 from thaJeztah/19.03_backport_fix_yamldocs
>> 9fd323afd Fix whitespace that caused short-format in generated YAML
>> c936ea969 Fix yamldocs generator to accomodate nested subcommands
>> d484456c2 Fix naming of reference docs files
>> 6a02465f4 docs: update code-hints for compatibility with "rouge"
>> f53663a95 Merge pull request #2364 from thaJeztah/19.03_backport_bump_golang_1.13
>>
>> Testing has been performed across x86-64/arm via cli and docker-compose.
>>
>> Signed-off-by: Ming Liu <ming.liu@toradex.com>
>> ---
>>  recipes-containers/docker/docker-moby.bb | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/recipes-containers/docker/docker-moby.bb b/recipes-containers/docker/docker-moby.bb
>> index 074ef08..634e5c0 100644
>> --- a/recipes-containers/docker/docker-moby.bb
>> +++ b/recipes-containers/docker/docker-moby.bb
>> @@ -35,9 +35,9 @@ DESCRIPTION = "Linux container runtime \
>>  #     to a docker.inc recipe
>>
>>  # moby commit matches the docker-engine bump on the 19.03 branch'
>> -SRCREV_moby = "aa6a9891b09cce3d9004121294301a30d45d998d"
>> -SRCREV_libnetwork = "c7bae399e46fd620b8a006174b7327e4e6e647fd"
>> -SRCREV_cli = "eb310fca49568dccd87c6136f774ef6fff2a1b51"
>> +SRCREV_moby = "9dc6525e6118a25fab2be322d1914740ea842495"
>> +SRCREV_libnetwork = "026aabaa659832804b01754aaadd2c0f420c68b6"
>> +SRCREV_cli = "0ed913b885c8919944a2e4c8d0b80a318a8dd48b"
>>  SRC_URI = "\
>>         git://github.com/moby/moby.git;branch=19.03;name=moby \
>>         git://github.com/docker/libnetwork.git;branch=bump_19.03;name=libnetwork;destsuffix=git/libnetwork \
>> @@ -57,7 +57,7 @@ GO_IMPORT = "import"
>>
>>  S = "${WORKDIR}/git"
>>
>> -DOCKER_VERSION = "19.03.8"
>> +DOCKER_VERSION = "19.03.12"
>>  PV = "${DOCKER_VERSION}+git${SRCREV_moby}"
>>
>>  PACKAGES =+ "${PN}-contrib"
>> --
>> 2.27.0
>>
>>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
