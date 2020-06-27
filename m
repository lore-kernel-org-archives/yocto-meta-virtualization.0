Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web12.409.1593219158963343467
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 26 Jun 2020 17:52:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oLEX7OVA;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id cy7so8236225edb.5
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 26 Jun 2020 17:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D+c53VtNfG0cGCP5MiT6K2/VZ34vravwbI31xDySmfQ=;
        b=oLEX7OVAVJfoNeKBn50ecscHVuuDOFZ7DH1/9Re2LKbgAYUfroPiNwHopVXJ70aKdd
         7iv2Jk5CCex9wTUo+tTTO6tT6HfHn6uCEcRy2c/ludKByvbmhNk0GUkwbbcrXlSKIWwR
         RQrm0NdPNvkYTC+laiBDHY94/ioLbuXQsbzm/6Ip7h/XIy81HoiYFWe+i/u6jVU4ReNq
         ltjheUQ2gErYk81XCOyaMggXKzAVc++lzUwUUaUADx2dd0iv7m1ItfoEp6DO67RuwsYW
         dWNp1moBDv/RO5QTeWwbFWC4rSPOj5rJxxw0pQd2jIV2llSjHz4Ym2rorGptC4WPLoCd
         gIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D+c53VtNfG0cGCP5MiT6K2/VZ34vravwbI31xDySmfQ=;
        b=N0fT2qZnfyfJWL639BEqZ7hbsU9ZpftOsB8VSEHfiujsUryt7yf2lZ1XrraubsXc5o
         5uWFvzMUE9de30Tc77SVxtmqiydwXGAebDyc34ozFq3wQAlWThlY/5f12CmmZmUnGlfH
         HkfU543OjsW62g1QSdmemJCdSvZmmhRHdoP0CoQsAPHdaktOW9vtgpg7G2/fM4X19ARn
         WaDPYtvtuTJlQ8SOXQD0Vf2cyvm4UWErsqbbXWs8IXwurdX0/LhZ0tSL3wYkauRit+f0
         RaY4Baidg8dn0yVh1lnKcpNMZ49S64ESnms4rZl1q3cslzrFSxFS9cbdn0ThjwGGuFqx
         4AQQ==
X-Gm-Message-State: AOAM533LxT1myyuCEkyRnI3t0kBhDCPVSDAPUI5omLB6yhaebTDiSoNt
	PZ+uqkAJv1t7yW9ab/yvRProHz+Ec6TyEULfu7s=
X-Google-Smtp-Source: ABdhPJxu/zw3dv0ZOXEk3q+NTnqp9azqIr3w6A/raANosH7mEZiKhHhIR9GRjA8GwtmmimxGEYqyAb/K1u/JoHO5sxw=
X-Received: by 2002:aa7:c3d7:: with SMTP id l23mr6093619edr.264.1593219157183;
 Fri, 26 Jun 2020 17:52:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200626161705.32600-1-liu.ming50@gmail.com> <CA+chaQei6WPUNkN0OOkk+MxEsWmnPSkTBAnrUq9KLbXmx87y1g@mail.gmail.com>
 <161C28A10F0C0173.4849@lists.yoctoproject.org> <CADkTA4NCh2F1=-aX7zwOaZvEC1as-r7=s=+C3HoWNr7MwyGh=A@mail.gmail.com>
 <CA+chaQemwGtgKjGqbdnaeEVG7st0QoM3o1JwppiVFY=2Hx6D4A@mail.gmail.com>
 <161C29D35303F5F1.8018@lists.yoctoproject.org> <CADkTA4OGYEC2=wuMfY4adbn2V4oyH02oac_=TqCURZUuY=pkTA@mail.gmail.com>
In-Reply-To: <CADkTA4OGYEC2=wuMfY4adbn2V4oyH02oac_=TqCURZUuY=pkTA@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 26 Jun 2020 17:52:26 -0700
Message-ID: <CA+chaQejB_++EQN4SX_R1PfXGOb=HSpQy9EtOPQe4SxVDXDSUA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] docker-moby: update to v19.03.12
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Ming Liu <liu.ming50@gmail.com>, ross.burton@arm.com, 
	meta-virtualization@lists.yoctoproject.org, 
	Stefan Agner <stefan.agner@toradex.com>, Ming Liu <ming.liu@toradex.com>
Content-Type: multipart/alternative; boundary="000000000000e9d0ce05a9063d20"

--000000000000e9d0ce05a9063d20
Content-Type: text/plain; charset="UTF-8"

You probably need to run build for some 32bit MACHINE (e.g. qemuarm) I was
seeing it with raspberrypi4.

On Fri, Jun 26, 2020 at 3:42 PM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> On Fri, Jun 26, 2020 at 1:59 PM Bruce Ashfield via
> lists.yoctoproject.org
> <bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
> >
> > On Fri, Jun 26, 2020 at 1:53 PM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > >
> > > In the layers I've included in my world builds there probably aren't
> many recipes using golang, but this issue isn't only in docker-moby recipe,
> I'm seeing it in 4 recipes (all from meta-virtualization):
> > >
> meta-virtualization/recipes-containers/docker-distribution/docker-distribution_git.bb:
> do_compile
> > >
> meta-virtualization/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb:
> do_compile
> > > meta-virtualization/recipes-containers/riddler/riddler_git.bb:
> do_compile
> > > meta-virtualization/recipes-containers/docker/docker-moby.bb:
> do_compile
> >
> > All of those are old, and likely share the same crime/heritage (i.e. I
> > created them about the same time), so hopefully the same fix holds for
> > all of them, and they likely share a deviation from a pattern and
> > could use an update.
> >
> > That does help me in my investigation, so thanks for the extra info.
> >
>
> One follow up question. Are you doing any other builds that show the error
> ?
>
> The reason I ask is that my qemuarm64 build just passed (without any
> fixes), so I'm just looking for confirmation that it is specific to
> some machine configs.
>
> Bruce
>
>
> > Bruce
> >
> > >
> > > I haven't reported it to Yocto bugzilla, nor to RP, but I've added
> Ross to this thread before.
> > >
> > > On Fri, Jun 26, 2020 at 7:45 PM Bruce Ashfield <
> bruce.ashfield@gmail.com> wrote:
> > >>
> > >> On Fri, Jun 26, 2020 at 1:37 PM Bruce Ashfield via
> > >> lists.yoctoproject.org
> > >> <bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
> > >> >
> > >> > On Fri, Jun 26, 2020 at 1:22 PM Martin Jansa <
> Martin.Jansa@gmail.com> wrote:
> > >> > >
> > >> > > Hi,
> > >> > >
> > >> > > docker-moby now fails to build because of go-native changes from
> Ross (
> https://git.openembedded.org/openembedded-core/commit/?id=c23f9e80492e4b1d47c0ada8eae3decf736253c7
> )
> > >> > >
> > >> > > ---> Making bundle: dynbinary (in bundles/dynbinary)
> > >> > > Building: bundles/dynbinary-daemon/dockerd-19.03.8
> > >> > > GOOS="linux" GOARCH="arm" GOARM="7"
> > >> > > # net
> > >> > > In file included from
> docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/recipe-sysroot/usr/include/gnu/stubs.h:23,
> > >> > >                  from
> docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/recipe-sysroot/usr/include/features.h:489,
> > >> > >                  from
> docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/recipe-sysroot/usr/include/netdb.h:25,
> > >> > >                  from
> ../../../recipe-sysroot-native/usr/lib/go/src/net/cgo_linux.go:10:
> > >> > >
> docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/recipe-sysroot/usr/include/gnu/stubs-32.h:7:11:
> fatal error: gnu/stubs-soft.h: No such file or directory
> > >> > >     7 | # include <gnu/stubs-soft.h>
> > >> > >       |           ^~~~~~~~~~~~~~~~~~
> > >> > > compilation terminated.
> > >> > > # os/user
> > >> > > In file included from
> docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/recipe-sysroot/usr/include/gnu/stubs.h:23,
> > >> > >                  from
> docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/recipe-sysroot/usr/include/features.h:489,
> > >> > >                  from
> docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/recipe-sysroot/usr/include/unistd.h:25,
> > >> > >                  from
> ../../../recipe-sysroot-native/usr/lib/go/src/os/user/cgo_lookup_unix.go:20:
> > >> > >
> docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/recipe-sysroot/usr/include/gnu/stubs-32.h:7:11:
> fatal error: gnu/stubs-soft.h: No such file or directory
> > >> > >     7 | # include <gnu/stubs-soft.h>
> > >> > >       |           ^~~~~~~~~~~~~~~~~~
> > >> > > compilation terminated.
> > >> > > WARNING: exit code 2 from a shell command.
> > >> > >
> > >> > > ERROR: Logfile of failure stored in:
> docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/temp/log.do_compile.30189
> > >> > >
> > >> > > This was shown in raspberrypi4 world build - I'm not using docker
> built with OE, but maybe it's something which should be fixed either in
> go-native or in docker recipes.
> > >> > >
> > >> > > I've tried a build with this docker upgrade applied and it
> doesn't help, reverting
> https://git.openembedded.org/openembedded-core/commit/?id=c23f9e80492e4b1d47c0ada8eae3decf736253c7
> still fixes the build.
> > >> >
> > >> > I was running into this as well, and was looking into it while
> working
> > >> > on a few upgrades.
> > >> >
> > >> > I still don't have a great idea for a fix, but am still looking at
> his.
> > >>
> > >> This is likely some historical baggage in the recipe with CGO flags.
> > >>
> > >> I'm working on something now, but do let me know if anyone else comes
> > >> up with a potential fix.
> > >>
> > >> Cheers,
> > >>
> > >> Bruce
> > >>
> > >> >
> > >> > Have we reported the issue to Ross/RP or in the yocto bugzilla yet ?
> > >> > It would be odd if the docker recipes were the only ones seeing
> this.
> > >> >
> > >> > Bruce
> > >> >
> > >> > >
> > >> > > Regards,
> > >> > >
> > >> > > On Fri, Jun 26, 2020 at 6:15 PM Ming Liu <liu.ming50@gmail.com>
> wrote:
> > >> > >>
> > >> > >> From: Ming Liu <ming.liu@toradex.com>
> > >> > >>
> > >> > >> Updating to 19.03.12 to pickup bugfixes and security changes. The
> > >> > >> following commits comprise this update:
> > >> > >>
> > >> > >> moby:
> > >> > >>
> > >> > >> 9dc6525e61 Merge pull request #41124 from
> thaJeztah/19.03_bump_libnetwork
> > >> > >> abb5beffff Merge pull request #41088 from
> thaJeztah/19.03_backport_invalid_cpu_shares_fix
> > >> > >> b4ca19a992 vendor: docker/libnetwork
> 026aabaa659832804b01754aaadd2c0f420c68b6 (bump_19.03 branch)
> > >> > >> d5a82971a4 Merge pull request #41082 from
> thaJeztah/19.03_backport_bump_golang_1.13.12
> > >> > >> 5fce12cf25 int-cli/TestRunInvalidCPUShares: fix for newer runc
> > >> > >> 058ea43c5c Bump Golang 1.13.12
> > >> > >> 77e06fda0c vendor libnetwork to
> 153d0769a1181bf591a9637fd487a541ec7db1e6
> > >> > >> b47e742558 Merge pull request #41027 from
> thaJeztah/19.03_bump_criu
> > >> > >> b85d75e29a Merge pull request #41009 from
> tiborvass/19.03-fix-dns-fallback-regression
> > >> > >> c104a50de4 integration: Add TestDaemonDNSFallback
> > >> > >> 9482566a5c vendor libnetwork to
> 71d4d82a5ce50453b1121d95544f0a2ae95bef9b
> > >> > >> d4e12315cd hack: add more debugging to understand exit codepath
> > >> > >> 4c24512241 Dockerfile: bump CRIU 3.14
> > >> > >> ad0f0b3970 Merge pull request #40978 from
> thaJeztah/19.03_backport_bump_golang_1.13.11
> > >> > >> 29796375c9 Bump Golang 1.13.11
> > >> > >> c1cc6ec81a Merge pull request #40988 from
> thaJeztah/19.03_backport_fix_gotestsum_install
> > >> > >> 8f1ab4e612 Fix bug in gotestsum installer causing dependencies
> to not be downloaded
> > >> > >> 811a247d06 Merge pull request #40970 from
> AkihiroSuda/archive-40939-1903
> > >> > >> 4d1885fb94 Merge pull request #40964 from
> AkihiroSuda/rootless-requires-slirp4netns-040-1903
> > >> > >> 0a3b2bda34 pkg/archive: escape ":" symbol in overlay lowerdir
> > >> > >> 9057ddf37c dockerd-rootless.sh: bump up slirp4netns requirement
> to v0.4.0
> > >> > >> ab567a4327 Merge pull request #40955 from
> tonistiigi/19.03-buildkit-update
> > >> > >> ee3f3ece72 Merge pull request #40951 from
> AkihiroSuda/rootlesskit-095-1903
> > >> > >> a76633684b vendor: update buildkit to a7d7b7f1
> > >> > >> 0803200be9 Merge pull request #40946 from
> thaJeztah/19.03_backport_fix_selinux_enotsup
> > >> > >> 706008a1da bump up rootlesskit to v0.9.5
> > >> > >> 57f6c9a0ef SELinux: fix ENOTSUP errors not being detected when
> relabeling
> > >> > >> c4c6cf6b6a Merge pull request #40921 from
> cpuguy83/19.03_log_rotate_error_handling
> > >> > >> 7d4dd91a52 logfile: Check if log is closed on close error during
> rotate
> > >> > >> edf2c49410 vendor: pkg/errors v0.9.1
> > >> > >> 1adcc64f40 Merge pull request #40877 from
> thaJeztah/19.03_update_buildkit
> > >> > >> e7349349fd Merge pull request #40850 from
> thaJeztah/19.03_backport_criu_3.13
> > >> > >> 3677003554 Merge pull request #40782 from
> thaJeztah/19.03_backport_switch_to_s390x_ubuntu_1804
> > >> > >> 63841af153 [19.03] vendor: buildkit v0.6.4-5-g59e305aa
> > >> > >> 2fbb374ab7 Merge pull request #40863 from
> AkihiroSuda/rootlesskit-094-1903
> > >> > >> 946d0ff67e bump up rootlesskit to v0.9.4
> > >> > >> 70e7d6fe4a Update CRIU to v3.13 "Silicon Willet"
> > >> > >> f432f71595 Merge pull request #40563 from
> thaJeztah/19.03_backport_fix_windows_file_handles
> > >> > >> 47a6d9b54f Merge pull request #40565 from
> thaJeztah/19.03_backport_fix_bip_subnet_config
> > >> > >> 6a0995e0d8 Merge pull request #40831 from
> thaJeztah/19.03_bump_swarmkit
> > >> > >> e4f239d68e [19.03] vendor: swarmkit
> 0b8364e7d08aa0e972241eb59ae981a67a587a0e
> > >> > >> 25b82fa9b8 Merge pull request #40801 from
> thaJeztah/19.03_backport_update_go_events
> > >> > >> e149ff62fe vendor: update go-events to fix alignment for 32bit
> systems
> > >> > >> 90a31c4829 Merge pull request #40809 from
> thaJeztah/19.03_update_libnetwork
> > >> > >> aa98b4f5d6 Merge pull request #40803 from
> thaJeztah/19.03_backport_bump_golang_1.13.10
> > >> > >> 860e7e273d Merge pull request #40800 from
> thaJeztah/19.03_backport_api_docs_fix_link
> > >> > >> a58b52b037 Merge pull request #40799 from
> thaJeztah/19.03_backport_fix_test_filter
> > >> > >> a6beb24dc5 [19.03] update libnetwork
> b9bcf0c3fba9ef8897c9676c5b70ba0345b84b17
> > >> > >> 282567a58d Bump Golang 1.13.10
> > >> > >> b66813eb45 api docs: fix broken link on GitHub
> > >> > >> edbb1d9e95 Merge pull request #40784 from
> thaJeztah/19.03_update_buildkit
> > >> > >> 9d8eccec8e Fix TEST_FILTER to work for both "integration" and
> "integration-cli"
> > >> > >> 4275aec641 Merge pull request #40592 from
> thaJeztah/19.03_backport_bump_golang_1.13
> > >> > >> 4b040147cf Merge pull request #40417 from
> thaJeztah/19.03_backport_test_fixes
> > >> > >> 08a2fe0d56 [19.03] vendor buildkit
> b26cff2413cc6a466f8739262efa13bd126f8fc7
> > >> > >> 1e1caccb13 Merge pull request #40780 from
> thaJeztah/19.03_backport_map_sync
> > >> > >> 5ba2bf37a8 Bump Golang 1.13.9
> > >> > >> f432a04243 Update Golang 1.13.8
> > >> > >> 81458b3144 Update Golang 1.13.7 (CVE-2020-0601, CVE-2020-7919)
> > >> > >> 4275aec641 Merge pull request #40592 from
> thaJeztah/19.03_backport_bump_golang_1.13
> > >> > >> 4b040147cf Merge pull request #40417 from
> thaJeztah/19.03_backport_test_fixes
> > >> > >> 08a2fe0d56 [19.03] vendor buildkit
> b26cff2413cc6a466f8739262efa13bd126f8fc7
> > >> > >> 1e1caccb13 Merge pull request #40780 from
> thaJeztah/19.03_backport_map_sync
> > >> > >> 5ba2bf37a8 Bump Golang 1.13.9
> > >> > >> f432a04243 Update Golang 1.13.8
> > >> > >> 81458b3144 Update Golang 1.13.7 (CVE-2020-0601, CVE-2020-7919)
> > >> > >> 6e1d159680 Update Golang 1.13.6
> > >> > >> 4241093b63 Update Golang 1.13.5
> > >> > >> 162fd8b856 Bump Golang 1.13.4
> > >> > >> 05a1ebd0fd Bump Golang 1.13.3 (CVE-2019-17596)
> > >> > >> f8d4276a89 bump golang 1.13.1 (CVE-2019-16276)
> > >> > >> 7df2d881f3 Bump Golang version 1.13.0
> > >> > >> fed832e224 Update to using alpine 3.10
> > >> > >> 4581499848 Switch to s390x Ubuntu 18.04
> > >> > >> f34a5b5af0 builder: fix concurrent map write
> > >> > >> 0df114a8f8 Merge pull request #40779 from
> thaJeztah/19.03_backport_unify_apis
> > >> > >> 9f5a5da4cb docs: add API versions v1.30 - v1.37
> > >> > >> 037d5a9e9a Merge pull request #40769 from
> thaJeztah/19.03_backport_seccomp_time64
> > >> > >> 5ed8f9a203 Merge pull request #40681 from
> thaJeztah/19.03_backport_schema2v1_dep_notice_on_error_only
> > >> > >> 284bbde996 seccomp: add 64-bit time_t syscalls
> > >> > >> 43b0a73273 Merge pull request #40758 from
> thaJeztah/19.03_backport_arm_matching
> > >> > >> 89f296a534 Merge pull request #40562 from
> thaJeztah/19.03_backport_39353_subgid_subuid
> > >> > >> d12b6d24d1 Merge pull request #40628 from
> cpuguy83/19.03_backport_39360_swarm_log_fill_rate
> > >> > >> 359edd8cbf [19.03] vendor: containerd
> 481103c8793316c118d9f795cde18060847c370e
> > >> > >> 1454987253 Merge pull request #40617 from SamWhited/19.03
> > >> > >> 021258661b Update libnetwork and DNS library
> > >> > >> 1db5199ddc Merge pull request #40564 from
> thaJeztah/19.03_backport_apparmor_fixes
> > >> > >> 6ed0f6ab78 Merge pull request #40652 from
> thaJeztah/19.03_backport_fix_backingfs
> > >> > >> 100d240d86 Move schema1 deprecation notice
> > >> > >> 4a4b3ed37f Merge pull request #40558 from
> thaJeztah/19.03_backport_buster_or_bust
> > >> > >> 57d5105759 bump windows-container-utility
> aa1ba87e99b68e0113bd27ec26c60b88f9d4ccd9
> > >> > >> 68db0c1739 Dockerfile: switch to iptables-legacy to match the
> host
> > >> > >> 4aaf3ead97 Dockerfile: switch golang image to "buster" variant,
> and update btrfs packages
> > >> > >> a070874828 hack/make: ignore failure to stop apparmor
> > >> > >> 237843a059 Dockerfile: align consecutive COPY lines
> > >> > >> 400b2850ff Dockerfile: order COPY lines by change frequency
> > >> > >> ddfeaf32ff Dockerfile: sort packages alphabetically
> > >> > >> cb813faebf Dockerfile: use build-arg for vpnkit
> > >> > >> 0499db23d1 Dockerfile: use spaces for indentation
> > >> > >> c77e7cb3d0 [19.03] Dockerfile: move CRIU_VERSION lower
> > >> > >> c6511ee4db bump vndr v0.1.1
> > >> > >> 0fa8a0c575 bump vndr v0.1.0 to support versioned import paths
> > >> > >> f3009e2f51 Use build args to override binary commits in
> dockerfile
> > >> > >> 92ca652fc9 Revert "dockerfile: update vndr to 85886e1a"
> > >> > >> fdad16840c go-swagger: fix panic
> > >> > >> 075e057de5 Dockerfile: set GO111MODULE=off
> > >> > >>
> > >> > >> bnetwork:
> > >> > >>
> > >> > >> 026aaba Merge pull request #2567 from
> thaJeztah/19.03_backport_no_error
> > >> > >> 8565f0b log error instead if disabling IPv6 router advertisement
> failed
> > >> > >> 86d159c Merge pull request #2565 from
> s0j/s0j_bump_19.03_fix-network-not-found
> > >> > >> bcb6dd6 Fix 'failed to get network during CreateEndpoint'
> > >> > >> 153d076 bridge: disable IPv6 router advertisements
> > >> > >> 71d4d82 Merge pull request #2552 from
> thaJeztah/19.03_backport_fix_error_handline
> > >> > >> fdaaa02 Resolver: fix error handling if we didn't receive a
> response
> > >> > >> 7cf227c Merge pull request #2517 from
> thaJeztah/19.03_backport_bump_golang_1.13
> > >> > >> b9bcf0c Merge pull request #2545 from
> thaJeztah/19.03_backport_fix_npe_ep_iface
> > >> > >> b09f24d Fix NPE due to null value returned by ep.Iface()
> > >> > >> 0941c3f Merge pull request #2541 from
> SamWhited/19.03_resolver_panic_backport
> > >> > >> 8068671 Fixes a panic in the DNS resolver
> > >> > >> 536ae72 Dockerfile: update to Go 1.13.8
> > >> > >> dcd9528 Fix gofmt in preparation of Go 1.13 update
> > >> > >> f0b038e regenerate protobufs with debian buster
> > >> > >> 34c8de5 Dockerfile: switch to debian "buster"
> > >> > >> 9660011 Dockerfile: update to Golang 1.12.17
> > >> > >> 026aaba Merge pull request #2567 from
> thaJeztah/19.03_backport_no_error
> > >> > >> 8565f0b log error instead if disabling IPv6 router advertisement
> failed
> > >> > >> 86d159c Merge pull request #2565 from
> s0j/s0j_bump_19.03_fix-network-not-found
> > >> > >> bcb6dd6 Fix 'failed to get network during CreateEndpoint'
> > >> > >> 153d076 bridge: disable IPv6 router advertisements
> > >> > >> 71d4d82 Merge pull request #2552 from
> thaJeztah/19.03_backport_fix_error_handline
> > >> > >> fdaaa02 Resolver: fix error handling if we didn't receive a
> response
> > >> > >> 7cf227c Merge pull request #2517 from
> thaJeztah/19.03_backport_bump_golang_1.13
> > >> > >> b9bcf0c Merge pull request #2545 from
> thaJeztah/19.03_backport_fix_npe_ep_iface
> > >> > >> b09f24d Fix NPE due to null value returned by ep.Iface()
> > >> > >> 0941c3f Merge pull request #2541 from
> SamWhited/19.03_resolver_panic_backport
> > >> > >> 8068671 Fixes a panic in the DNS resolver
> > >> > >> 536ae72 Dockerfile: update to Go 1.13.8
> > >> > >> dcd9528 Fix gofmt in preparation of Go 1.13 update
> > >> > >> f0b038e regenerate protobufs with debian buster
> > >> > >> 34c8de5 Dockerfile: switch to debian "buster"
> > >> > >> 9660011 Dockerfile: update to Golang 1.12.17
> > >> > >>
> > >> > >> cli:
> > >> > >>
> > >> > >> 0ed913b88 Merge pull request #2592 from
> thaJeztah/19.03_backport_logout_config_out_of_sync2
> > >> > >> ab45dc8fd Merge pull request #2591 from
> thaJeztah/19.03_backport_docs_fixes2
> > >> > >> 0ed913b88 Merge pull request #2592 from
> thaJeztah/19.03_backport_logout_config_out_of_sync2
> > >> > >> ab45dc8fd Merge pull request #2591 from
> thaJeztah/19.03_backport_docs_fixes2
> > >> > >> 5a12f90b4 Don't filter out registries to logout from with config
> file contents
> > >> > >> 0ed913b88 Merge pull request #2592 from
> thaJeztah/19.03_backport_logout_config_out_of_sync2
> > >> > >> ab45dc8fd Merge pull request #2591 from
> thaJeztah/19.03_backport_docs_fixes2
> > >> > >> 5a12f90b4 Don't filter out registries to logout from with config
> file contents
> > >> > >> 521a636a8 Add MOBY_DISABLE_PIGZ to dockerd environment variable
> docs
> > >> > >> 8b8ec04cd Split up environment variable documentation between
> cli and dockerd
> > >> > >> 4e7c875e3 Fix broken link
> > >> > >> 2e6ff15da Merge pull request #2557 from
> thaJeztah/19.03_backport_fix_plugin_api_link
> > >> > >> f56d1b364 Merge pull request #2575 from
> thaJeztah/19.03_backport_bump_golang_1.13.12
> > >> > >> 8e7ff60ee Merge pull request #2589 from
> thaJeztah/19.03_backport_bump_x_text
> > >> > >> 6cb678f16 vendor: golang.org/x/text v0.3.3
> > >> > >> 4515c5187 vendor: golang.org/x/text v0.3.2
> > >> > >> 43a4e09bb Merge pull request #2586 from
> thaJeztah/19.03_backport_context_dont_loose_additional_fields
> > >> > >> cfa1fd9ac Don't loose additional metadata fields
> > >> > >> 6051b36db Merge pull request #2570 from
> thaJeztah/19.03_backport_hardcode_name_in_errors
> > >> > >> 31d338dd3 Bump Golang 1.13.12
> > >> > >> 9cc05b9ce Merge pull request #2548 from
> thaJeztah/19.03_backport_fix_dockerd_api_link
> > >> > >> 936d328da Use consistent name for errors
> > >> > >> dd360c7c0 Merge pull request #2558 from
> tiborvass/19.03-expenv-panic
> > >> > >> 92b54c256 Merge pull request #2560 from tiborvass/19.03-sshfix
> > >> > >> 2ee798198 ssh: avoid setting flags through hostname
> > >> > >> e90b6bcb6 Fix bug with panic when DOCKER_CLI_EXPERIMENTAL
> environment variable is incorrect
> > >> > >> 97afb7295 docs/extend: fix broken link and some markdown
> touch-ups
> > >> > >> c280cdfd6 docs: fix broken link in dockerd.md
> > >> > >> fd7874f16 Merge pull request #2532 from
> thaJeztah/19.03_backport_bump_golang_1.13.11
> > >> > >> a945f0e7e Merge pull request #2538 from
> silvin-lubecki/fix-version-old-engine-19-03
> > >> > >> 0f59532a1 Run e2e tests with different engine version on Jenkins
> Rewrite Jenkinsfile to new declarative syntax without parallel as the e2e
> framework is not tailored for than (container name clash, port clash,...)
> > >> > >> 95df3499b Add a new Makefile variable to override DockerInDocker
> engine version we use to run e2e tests
> > >> > >> 2d1476c6f Partially revert
> cf663b526a34f3e7911e6e60138138c2023aa844 as it breaks the version
> negotiation with an older docker engine.
> > >> > >> 936e9717e Bump Golang 1.13.11
> > >> > >> ab108430b Merge pull request #2520 from
> thaJeztah/19.03_backport_markup_touch_ups
> > >> > >> 489c7e9cd docs: more Markdown touch-ups
> > >> > >> 1705e47cd Merge pull request #2508 from
> thaJeztah/19.03_backport_config_dont_init
> > >> > >> a9a83d2e7 Merge pull request #2516 from
> thaJeztah/19.03_backport_bump_klog
> > >> > >> ae2012cce Merge pull request #2518 from
> thaJeztah/19.03_backport_bump_pkg_errors
> > >> > >> 052a71c4d Merge pull request #2509 from
> thaJeztah/19.03_backport_docs_fixes
> > >> > >> 9a57ea886 Update some uses of errors.Cause() to errors.Is()
> > >> > >> 345b0e79e vendor: pkg/errors v0.9.1
> > >> > >> 62a9babca vendor: k8s.io/klog v1.0.0-2-g4ad0115
> > >> > >> dbc73eafc docs: fix, and touch-up "docker context" docs
> > >> > >> e06fc01c1 Update dead link and add missing info on COPY
> > >> > >> 8434242c7 config: don't call homedir on init()
> > >> > >> bef0d567a Merge pull request #2493 from
> thaJeztah/19.03_backport_update_dockerd_usage
> > >> > >> 65c37227a docs: update usage output for dockerd (19.03)
> > >> > >> 55a5ab0f0 docs: fix order of flags in usage, and fix missing
> quote
> > >> > >> a2d8a8a4c Merge pull request #2484 from
> thaJeztah/19.03_backport_fix_builder_link
> > >> > >> c150ba2b8 builder: fix broken link
> > >> > >> 392993336 Merge pull request #2457 from
> thaJeztah/19.03_backport_lazy_feature_detection
> > >> > >> 62baa3ce5 Merge pull request #2471 from
> thaJeztah/19.03_backport_fix_bind_panic
> > >> > >> 7a2de8165 Merge pull request #2470 from
> thaJeztah/19.03_backport_bump_yaml
> > >> > >> 0ea509c77 Merge pull request #2481 from
> thaJeztah/19.03_backport_fix_run_reference_links
> > >> > >> 81909d70f docs: fix links, and minor markdown touch-ups
> > >> > >> cf663b526 cli: perform feature detection lazily
> > >> > >> c44c18e08 docker build: check experimental --platform on pre-run
> > >> > >> 25f04876d app-214 Load Client info in getter function
> > >> > >> e470eef36 Merge pull request #2469 from
> thaJeztah/19.03_backport_docs
> > >> > >> 4ad65fc35 fix panic on single-character volumes
> > >> > >> 83d4cb900 vendor: bump gopkg.in/yaml.v2 v2.2.8
> > >> > >> 0cfe29431 service update: fix service create example
> > >> > >> 62baa3ce5 Merge pull request #2471 from
> thaJeztah/19.03_backport_fix_bind_panic
> > >> > >> 7a2de8165 Merge pull request #2470 from
> thaJeztah/19.03_backport_bump_yaml
> > >> > >> 0ea509c77 Merge pull request #2481 from
> thaJeztah/19.03_backport_fix_run_reference_links
> > >> > >> 81909d70f docs: fix links, and minor markdown touch-ups
> > >> > >> cf663b526 cli: perform feature detection lazily
> > >> > >> c44c18e08 docker build: check experimental --platform on pre-run
> > >> > >> 25f04876d app-214 Load Client info in getter function
> > >> > >> e470eef36 Merge pull request #2469 from
> thaJeztah/19.03_backport_docs
> > >> > >> 4ad65fc35 fix panic on single-character volumes
> > >> > >> 83d4cb900 vendor: bump gopkg.in/yaml.v2 v2.2.8
> > >> > >> 0cfe29431 service update: fix service create example
> > >> > >> 2dc593f67 Add container_iface_prefix option to documentation
> > >> > >> d25e65734 Merge pull request #2445 from
> thaJeztah/19.03_backport_network_prune_improve_message
> > >> > >> 8986e3120 Merge pull request #2456 from
> thaJeztah/19.03_backport_gotest_v3
> > >> > >> 4fe6b837b bump gotest.tools v3.0.1 for compatibility with Go 1.14
> > >> > >> a8454a4d9 update vndr v0.1.1
> > >> > >> 950dcedd9 bump vndr v0.1.0 to support versioned import paths
> > >> > >> 05ad944d1 Merge pull request #2453 from
> thaJeztah/19.03_backport_fixup_markdown_and_links
> > >> > >> 0d26cbf5b yamldocs: add description to base command
> > >> > >> d4e4fa3b4 experimental/vlan-networks: markdown touch-ups
> > >> > >> de12dbfb1 docs/reference: explain "colon"
> > >> > >> 7ae77e51f docs/extend: reformat notes
> > >> > >> 733ae82da docs/builder: touch up markdown, and some minor
> rephrasing
> > >> > >> 9a1ba7d39 docs/reference/run.md: touch-up markdown
> > >> > >> 6ba9a3e4c reference docs: reformat notes
> > >> > >> 96eb0888f reference docs: fix broken links and markdown touch-ups
> > >> > >> 2676c603f Adding missing title in builder.md
> > >> > >> 365bae4f8 Add clarification when using USER UID:GI
> > >> > >> 04533bd52 Merge pull request #2442 from
> thaJeztah/19.03_backport_update_go_events
> > >> > >> c38b26007 improve "network prune" output to mention custom
> networks only
> > >> > >> ba0a2ffe2 Merge pull request #2444 from
> thaJeztah/19.03_backport_host_gateway_validation
> > >> > >> fd9eedce3 Add "host-gateway" to tests for extra_hosts /
> --add-host
> > >> > >> 365118982 Skip IPAddr validation for "host-gateway" string
> > >> > >> a0f0ed1f5 vendor: update go-events to fix alignment for 32bit
> systems
> > >> > >> 173c85ad7 Merge pull request #2431 from
> thaJeztah/19.03_backport_bump_golang_1.13.10
> > >> > >> de6a5fa44 Bump Golang 1.13.10
> > >> > >> 1a4749b8e Merge pull request #2435 from
> thaJeztah/19.03_backport_bump_certificates
> > >> > >> 19ccd4f5d CI: update notary test certificates
> > >> > >> d7f5f70c3 Merge pull request #2419 from
> thaJeztah/19.03_backport_bump_golang_1.13.9
> > >> > >> f8fc68f17 Bump Golang 1.13.9
> > >> > >> 7d4850005 Merge pull request #2403 from
> thaJeztah/19.03_backport_update_deprecation_policy
> > >> > >> 22cbf9161 Update deprecation policy to 1 stable release
> > >> > >> 0b0ea3f0f Merge pull request #2401 from
> thaJeztah/19.03_backport_deprecation_policy
> > >> > >> 288cdec29 Include deprecation policy on deprecated features page
> > >> > >> a4d902af5 Merge pull request #2399 from
> thaJeztah/19.03_backport_remove_comments
> > >> > >> ffffc1ed4 remove unneeded comment from reference files
> > >> > >> bf1f5fcfb Merge pull request #2393 from
> thaJeztah/19.03_backport_codehints_compatibility
> > >> > >> c35400655 Merge pull request #2391 from
> thaJeztah/19.03_backport_fix_yamldocs
> > >> > >> 9fd323afd Fix whitespace that caused short-format in generated
> YAML
> > >> > >> c936ea969 Fix yamldocs generator to accomodate nested subcommands
> > >> > >> d484456c2 Fix naming of reference docs files
> > >> > >> 6a02465f4 docs: update code-hints for compatibility with "rouge"
> > >> > >> f53663a95 Merge pull request #2364 from
> thaJeztah/19.03_backport_bump_golang_1.13
> > >> > >>
> > >> > >> Testing has been performed across x86-64/arm via cli and
> docker-compose.
> > >> > >>
> > >> > >> Signed-off-by: Ming Liu <ming.liu@toradex.com>
> > >> > >> ---
> > >> > >>  recipes-containers/docker/docker-moby.bb | 8 ++++----
> > >> > >>  1 file changed, 4 insertions(+), 4 deletions(-)
> > >> > >>
> > >> > >> diff --git a/recipes-containers/docker/docker-moby.bb
> b/recipes-containers/docker/docker-moby.bb
> > >> > >> index 074ef08..634e5c0 100644
> > >> > >> --- a/recipes-containers/docker/docker-moby.bb
> > >> > >> +++ b/recipes-containers/docker/docker-moby.bb
> > >> > >> @@ -35,9 +35,9 @@ DESCRIPTION = "Linux container runtime \
> > >> > >>  #     to a docker.inc recipe
> > >> > >>
> > >> > >>  # moby commit matches the docker-engine bump on the 19.03
> branch'
> > >> > >> -SRCREV_moby = "aa6a9891b09cce3d9004121294301a30d45d998d"
> > >> > >> -SRCREV_libnetwork = "c7bae399e46fd620b8a006174b7327e4e6e647fd"
> > >> > >> -SRCREV_cli = "eb310fca49568dccd87c6136f774ef6fff2a1b51"
> > >> > >> +SRCREV_moby = "9dc6525e6118a25fab2be322d1914740ea842495"
> > >> > >> +SRCREV_libnetwork = "026aabaa659832804b01754aaadd2c0f420c68b6"
> > >> > >> +SRCREV_cli = "0ed913b885c8919944a2e4c8d0b80a318a8dd48b"
> > >> > >>  SRC_URI = "\
> > >> > >>         git://github.com/moby/moby.git;branch=19.03;name=moby \
> > >> > >>         git://
> github.com/docker/libnetwork.git;branch=bump_19.03;name=libnetwork;destsuffix=git/libnetwork
> \
> > >> > >> @@ -57,7 +57,7 @@ GO_IMPORT = "import"
> > >> > >>
> > >> > >>  S = "${WORKDIR}/git"
> > >> > >>
> > >> > >> -DOCKER_VERSION = "19.03.8"
> > >> > >> +DOCKER_VERSION = "19.03.12"
> > >> > >>  PV = "${DOCKER_VERSION}+git${SRCREV_moby}"
> > >> > >>
> > >> > >>  PACKAGES =+ "${PN}-contrib"
> > >> > >> --
> > >> > >> 2.27.0
> > >> > >>
> > >> > >>
> > >> > >
> > >> >
> > >> >
> > >> >
> > >> > --
> > >> > - Thou shalt not follow the NULL pointer, for chaos and madness
> await
> > >> > thee at its end
> > >> > - "Use the force Harry" - Gandalf, Star Trek II
> > >> >
> > >>
> > >>
> > >>
> > >> --
> > >> - Thou shalt not follow the NULL pointer, for chaos and madness await
> > >> thee at its end
> > >> - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> > 
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--000000000000e9d0ce05a9063d20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You probably need to run build for some 32bit MACHINE (e.g=
. qemuarm) I was seeing it with raspberrypi4.</div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 26, 2020 at 3:42 P=
M Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashf=
ield@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Fri, Jun 26, 2020 at 1:59 PM Bruce Ashfield via<br>
<a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_bl=
ank">lists.yoctoproject.org</a><br>
&lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org" t=
arget=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Fri, Jun 26, 2020 at 1:53 PM Martin Jansa &lt;<a href=3D"mailto:ma=
rtin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrot=
e:<br>
&gt; &gt;<br>
&gt; &gt; In the layers I&#39;ve included in my world builds there probabl=
y aren&#39;t many recipes using golang, but this issue isn&#39;t only in do=
cker-moby recipe, I&#39;m seeing it in 4 recipes (all from meta-virtualizat=
ion):<br>
&gt; &gt; meta-virtualization/recipes-containers/docker-distribution/docke=
r-distribution_git.bb:do_compile<br>
&gt; &gt; meta-virtualization/recipes-containers/oci-runtime-tools/oci-run=
time-tools_git.bb:do_compile<br>
&gt; &gt; meta-virtualization/recipes-containers/riddler/riddler_git.bb:do=
_compile<br>
&gt; &gt; meta-virtualization/recipes-containers/docker/docker-moby.bb:do_=
compile<br>
&gt;<br>
&gt; All of those are old, and likely share the same crime/heritage (i.e. =
I<br>
&gt; created them about the same time), so hopefully the same fix holds fo=
r<br>
&gt; all of them, and they likely share a deviation from a pattern and<br>
&gt; could use an update.<br>
&gt;<br>
&gt; That does help me in my investigation, so thanks for the extra info.<=
br>
&gt;<br>
<br>
One follow up question. Are you doing any other builds that show the error=
 ?<br>
<br>
The reason I ask is that my qemuarm64 build just passed (without any<br>
fixes), so I&#39;m just looking for confirmation that it is specific to<br=
>
some machine configs.<br>
<br>
Bruce<br>
<br>
<br>
&gt; Bruce<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; I haven&#39;t reported it to Yocto bugzilla, nor to RP, but I&#3=
9;ve added Ross to this thread before.<br>
&gt; &gt;<br>
&gt; &gt; On Fri, Jun 26, 2020 at 7:45 PM Bruce Ashfield &lt;<a href=3D"ma=
ilto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</=
a>&gt; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Fri, Jun 26, 2020 at 1:37 PM Bruce Ashfield via<br>
&gt; &gt;&gt; <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer"=
 target=3D"_blank">lists.yoctoproject.org</a><br>
&gt; &gt;&gt; &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yocto=
project.org" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wro=
te:<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; On Fri, Jun 26, 2020 at 1:22 PM Martin Jansa &lt;<a hre=
f=3D"mailto:Martin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.co=
m</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; Hi,<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; docker-moby now fails to build because of go-nativ=
e changes from Ross (<a href=3D"https://git.openembedded.org/openembedded-c=
ore/commit/?id=3Dc23f9e80492e4b1d47c0ada8eae3decf736253c7" rel=3D"noreferre=
r" target=3D"_blank">https://git.openembedded.org/openembedded-core/commit/=
?id=3Dc23f9e80492e4b1d47c0ada8eae3decf736253c7</a>)<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; ---&gt; Making bundle: dynbinary (in bundles/dynbi=
nary)<br>
&gt; &gt;&gt; &gt; &gt; Building: bundles/dynbinary-daemon/dockerd-19.03.8=
<br>
&gt; &gt;&gt; &gt; &gt; GOOS=3D&quot;linux&quot; GOARCH=3D&quot;arm&quot; =
GOARM=3D&quot;7&quot;<br>
&gt; &gt;&gt; &gt; &gt; # net<br>
&gt; &gt;&gt; &gt; &gt; In file included from docker-moby/19.03.8+gitaa6a9=
891b09cce3d9004121294301a30d45d998d-r0/recipe-sysroot/usr/include/gnu/stubs=
.h:23,<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 from docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30=
d45d998d-r0/recipe-sysroot/usr/include/features.h:489,<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 from docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30=
d45d998d-r0/recipe-sysroot/usr/include/netdb.h:25,<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 from ../../../recipe-sysroot-native/usr/lib/go/src/net/cgo_l=
inux.go:10:<br>
&gt; &gt;&gt; &gt; &gt; docker-moby/19.03.8+gitaa6a9891b09cce3d90041212943=
01a30d45d998d-r0/recipe-sysroot/usr/include/gnu/stubs-32.h:7:11: fatal erro=
r: gnu/stubs-soft.h: No such file or directory<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07 | # include &lt;gnu/stubs-sof=
t.h&gt;<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~<br>
&gt; &gt;&gt; &gt; &gt; compilation terminated.<br>
&gt; &gt;&gt; &gt; &gt; # os/user<br>
&gt; &gt;&gt; &gt; &gt; In file included from docker-moby/19.03.8+gitaa6a9=
891b09cce3d9004121294301a30d45d998d-r0/recipe-sysroot/usr/include/gnu/stubs=
.h:23,<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 from docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30=
d45d998d-r0/recipe-sysroot/usr/include/features.h:489,<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 from docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30=
d45d998d-r0/recipe-sysroot/usr/include/unistd.h:25,<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 from ../../../recipe-sysroot-native/usr/lib/go/src/os/user/c=
go_lookup_unix.go:20:<br>
&gt; &gt;&gt; &gt; &gt; docker-moby/19.03.8+gitaa6a9891b09cce3d90041212943=
01a30d45d998d-r0/recipe-sysroot/usr/include/gnu/stubs-32.h:7:11: fatal erro=
r: gnu/stubs-soft.h: No such file or directory<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07 | # include &lt;gnu/stubs-sof=
t.h&gt;<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~<br>
&gt; &gt;&gt; &gt; &gt; compilation terminated.<br>
&gt; &gt;&gt; &gt; &gt; WARNING: exit code 2 from a shell command.<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; ERROR: Logfile of failure stored in: docker-moby/1=
9.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/temp/log.do_compile.3=
0189<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; This was shown in raspberrypi4 world build - I&#39=
;m not using docker built with OE, but maybe it&#39;s something which shoul=
d be fixed either in go-native or in docker recipes.<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; I&#39;ve tried a build with this docker upgrade ap=
plied and it doesn&#39;t help, reverting <a href=3D"https://git.openembedde=
d.org/openembedded-core/commit/?id=3Dc23f9e80492e4b1d47c0ada8eae3decf736253=
c7" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/opene=
mbedded-core/commit/?id=3Dc23f9e80492e4b1d47c0ada8eae3decf736253c7</a> stil=
l fixes the build.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; I was running into this as well, and was looking into i=
t while working<br>
&gt; &gt;&gt; &gt; on a few upgrades.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; I still don&#39;t have a great idea for a fix, but am s=
till looking at his.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; This is likely some historical baggage in the recipe with CG=
O flags.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I&#39;m working on something now, but do let me know if anyo=
ne else comes<br>
&gt; &gt;&gt; up with a potential fix.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Cheers,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Bruce<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Have we reported the issue to Ross/RP or in the yocto b=
ugzilla yet ?<br>
&gt; &gt;&gt; &gt; It would be odd if the docker recipes were the only one=
s seeing this.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Bruce<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; Regards,<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; On Fri, Jun 26, 2020 at 6:15 PM Ming Liu &lt;<a hr=
ef=3D"mailto:liu.ming50@gmail.com" target=3D"_blank">liu.ming50@gmail.com</=
a>&gt; wrote:<br>
&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt; From: Ming Liu &lt;<a href=3D"mailto:ming.liu@=
toradex.com" target=3D"_blank">ming.liu@toradex.com</a>&gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt; Updating to 19.03.12 to pickup bugfixes and se=
curity changes. The<br>
&gt; &gt;&gt; &gt; &gt;&gt; following commits comprise this update:<br>
&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt; moby:<br>
&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt; 9dc6525e61 Merge pull request #41124 from thaJ=
eztah/19.03_bump_libnetwork<br>
&gt; &gt;&gt; &gt; &gt;&gt; abb5beffff Merge pull request #41088 from thaJ=
eztah/19.03_backport_invalid_cpu_shares_fix<br>
&gt; &gt;&gt; &gt; &gt;&gt; b4ca19a992 vendor: docker/libnetwork 026aabaa6=
59832804b01754aaadd2c0f420c68b6 (bump_19.03 branch)<br>
&gt; &gt;&gt; &gt; &gt;&gt; d5a82971a4 Merge pull request #41082 from thaJ=
eztah/19.03_backport_bump_golang_1.13.12<br>
&gt; &gt;&gt; &gt; &gt;&gt; 5fce12cf25 int-cli/TestRunInvalidCPUShares: fi=
x for newer runc<br>
&gt; &gt;&gt; &gt; &gt;&gt; 058ea43c5c Bump Golang 1.13.12<br>
&gt; &gt;&gt; &gt; &gt;&gt; 77e06fda0c vendor libnetwork to 153d0769a1181b=
f591a9637fd487a541ec7db1e6<br>
&gt; &gt;&gt; &gt; &gt;&gt; b47e742558 Merge pull request #41027 from thaJ=
eztah/19.03_bump_criu<br>
&gt; &gt;&gt; &gt; &gt;&gt; b85d75e29a Merge pull request #41009 from tibo=
rvass/19.03-fix-dns-fallback-regression<br>
&gt; &gt;&gt; &gt; &gt;&gt; c104a50de4 integration: Add TestDaemonDNSFallb=
ack<br>
&gt; &gt;&gt; &gt; &gt;&gt; 9482566a5c vendor libnetwork to 71d4d82a5ce504=
53b1121d95544f0a2ae95bef9b<br>
&gt; &gt;&gt; &gt; &gt;&gt; d4e12315cd hack: add more debugging to underst=
and exit codepath<br>
&gt; &gt;&gt; &gt; &gt;&gt; 4c24512241 Dockerfile: bump CRIU 3.14<br>
&gt; &gt;&gt; &gt; &gt;&gt; ad0f0b3970 Merge pull request #40978 from thaJ=
eztah/19.03_backport_bump_golang_1.13.11<br>
&gt; &gt;&gt; &gt; &gt;&gt; 29796375c9 Bump Golang 1.13.11<br>
&gt; &gt;&gt; &gt; &gt;&gt; c1cc6ec81a Merge pull request #40988 from thaJ=
eztah/19.03_backport_fix_gotestsum_install<br>
&gt; &gt;&gt; &gt; &gt;&gt; 8f1ab4e612 Fix bug in gotestsum installer caus=
ing dependencies to not be downloaded<br>
&gt; &gt;&gt; &gt; &gt;&gt; 811a247d06 Merge pull request #40970 from Akih=
iroSuda/archive-40939-1903<br>
&gt; &gt;&gt; &gt; &gt;&gt; 4d1885fb94 Merge pull request #40964 from Akih=
iroSuda/rootless-requires-slirp4netns-040-1903<br>
&gt; &gt;&gt; &gt; &gt;&gt; 0a3b2bda34 pkg/archive: escape &quot;:&quot; s=
ymbol in overlay lowerdir<br>
&gt; &gt;&gt; &gt; &gt;&gt; 9057ddf37c dockerd-rootless.sh: bump up slirp4=
netns requirement to v0.4.0<br>
&gt; &gt;&gt; &gt; &gt;&gt; ab567a4327 Merge pull request #40955 from toni=
stiigi/19.03-buildkit-update<br>
&gt; &gt;&gt; &gt; &gt;&gt; ee3f3ece72 Merge pull request #40951 from Akih=
iroSuda/rootlesskit-095-1903<br>
&gt; &gt;&gt; &gt; &gt;&gt; a76633684b vendor: update buildkit to a7d7b7f1=
<br>
&gt; &gt;&gt; &gt; &gt;&gt; 0803200be9 Merge pull request #40946 from thaJ=
eztah/19.03_backport_fix_selinux_enotsup<br>
&gt; &gt;&gt; &gt; &gt;&gt; 706008a1da bump up rootlesskit to v0.9.5<br>
&gt; &gt;&gt; &gt; &gt;&gt; 57f6c9a0ef SELinux: fix ENOTSUP errors not bei=
ng detected when relabeling<br>
&gt; &gt;&gt; &gt; &gt;&gt; c4c6cf6b6a Merge pull request #40921 from cpug=
uy83/19.03_log_rotate_error_handling<br>
&gt; &gt;&gt; &gt; &gt;&gt; 7d4dd91a52 logfile: Check if log is closed on =
close error during rotate<br>
&gt; &gt;&gt; &gt; &gt;&gt; edf2c49410 vendor: pkg/errors v0.9.1<br>
&gt; &gt;&gt; &gt; &gt;&gt; 1adcc64f40 Merge pull request #40877 from thaJ=
eztah/19.03_update_buildkit<br>
&gt; &gt;&gt; &gt; &gt;&gt; e7349349fd Merge pull request #40850 from thaJ=
eztah/19.03_backport_criu_3.13<br>
&gt; &gt;&gt; &gt; &gt;&gt; 3677003554 Merge pull request #40782 from thaJ=
eztah/19.03_backport_switch_to_s390x_ubuntu_1804<br>
&gt; &gt;&gt; &gt; &gt;&gt; 63841af153 [19.03] vendor: buildkit v0.6.4-5-g=
59e305aa<br>
&gt; &gt;&gt; &gt; &gt;&gt; 2fbb374ab7 Merge pull request #40863 from Akih=
iroSuda/rootlesskit-094-1903<br>
&gt; &gt;&gt; &gt; &gt;&gt; 946d0ff67e bump up rootlesskit to v0.9.4<br>
&gt; &gt;&gt; &gt; &gt;&gt; 70e7d6fe4a Update CRIU to v3.13 &quot;Silicon =
Willet&quot;<br>
&gt; &gt;&gt; &gt; &gt;&gt; f432f71595 Merge pull request #40563 from thaJ=
eztah/19.03_backport_fix_windows_file_handles<br>
&gt; &gt;&gt; &gt; &gt;&gt; 47a6d9b54f Merge pull request #40565 from thaJ=
eztah/19.03_backport_fix_bip_subnet_config<br>
&gt; &gt;&gt; &gt; &gt;&gt; 6a0995e0d8 Merge pull request #40831 from thaJ=
eztah/19.03_bump_swarmkit<br>
&gt; &gt;&gt; &gt; &gt;&gt; e4f239d68e [19.03] vendor: swarmkit 0b8364e7d0=
8aa0e972241eb59ae981a67a587a0e<br>
&gt; &gt;&gt; &gt; &gt;&gt; 25b82fa9b8 Merge pull request #40801 from thaJ=
eztah/19.03_backport_update_go_events<br>
&gt; &gt;&gt; &gt; &gt;&gt; e149ff62fe vendor: update go-events to fix ali=
gnment for 32bit systems<br>
&gt; &gt;&gt; &gt; &gt;&gt; 90a31c4829 Merge pull request #40809 from thaJ=
eztah/19.03_update_libnetwork<br>
&gt; &gt;&gt; &gt; &gt;&gt; aa98b4f5d6 Merge pull request #40803 from thaJ=
eztah/19.03_backport_bump_golang_1.13.10<br>
&gt; &gt;&gt; &gt; &gt;&gt; 860e7e273d Merge pull request #40800 from thaJ=
eztah/19.03_backport_api_docs_fix_link<br>
&gt; &gt;&gt; &gt; &gt;&gt; a58b52b037 Merge pull request #40799 from thaJ=
eztah/19.03_backport_fix_test_filter<br>
&gt; &gt;&gt; &gt; &gt;&gt; a6beb24dc5 [19.03] update libnetwork b9bcf0c3f=
ba9ef8897c9676c5b70ba0345b84b17<br>
&gt; &gt;&gt; &gt; &gt;&gt; 282567a58d Bump Golang 1.13.10<br>
&gt; &gt;&gt; &gt; &gt;&gt; b66813eb45 api docs: fix broken link on GitHub=
<br>
&gt; &gt;&gt; &gt; &gt;&gt; edbb1d9e95 Merge pull request #40784 from thaJ=
eztah/19.03_update_buildkit<br>
&gt; &gt;&gt; &gt; &gt;&gt; 9d8eccec8e Fix TEST_FILTER to work for both &q=
uot;integration&quot; and &quot;integration-cli&quot;<br>
&gt; &gt;&gt; &gt; &gt;&gt; 4275aec641 Merge pull request #40592 from thaJ=
eztah/19.03_backport_bump_golang_1.13<br>
&gt; &gt;&gt; &gt; &gt;&gt; 4b040147cf Merge pull request #40417 from thaJ=
eztah/19.03_backport_test_fixes<br>
&gt; &gt;&gt; &gt; &gt;&gt; 08a2fe0d56 [19.03] vendor buildkit b26cff2413c=
c6a466f8739262efa13bd126f8fc7<br>
&gt; &gt;&gt; &gt; &gt;&gt; 1e1caccb13 Merge pull request #40780 from thaJ=
eztah/19.03_backport_map_sync<br>
&gt; &gt;&gt; &gt; &gt;&gt; 5ba2bf37a8 Bump Golang 1.13.9<br>
&gt; &gt;&gt; &gt; &gt;&gt; f432a04243 Update Golang 1.13.8<br>
&gt; &gt;&gt; &gt; &gt;&gt; 81458b3144 Update Golang 1.13.7 (CVE-2020-0601=
, CVE-2020-7919)<br>
&gt; &gt;&gt; &gt; &gt;&gt; 4275aec641 Merge pull request #40592 from thaJ=
eztah/19.03_backport_bump_golang_1.13<br>
&gt; &gt;&gt; &gt; &gt;&gt; 4b040147cf Merge pull request #40417 from thaJ=
eztah/19.03_backport_test_fixes<br>
&gt; &gt;&gt; &gt; &gt;&gt; 08a2fe0d56 [19.03] vendor buildkit b26cff2413c=
c6a466f8739262efa13bd126f8fc7<br>
&gt; &gt;&gt; &gt; &gt;&gt; 1e1caccb13 Merge pull request #40780 from thaJ=
eztah/19.03_backport_map_sync<br>
&gt; &gt;&gt; &gt; &gt;&gt; 5ba2bf37a8 Bump Golang 1.13.9<br>
&gt; &gt;&gt; &gt; &gt;&gt; f432a04243 Update Golang 1.13.8<br>
&gt; &gt;&gt; &gt; &gt;&gt; 81458b3144 Update Golang 1.13.7 (CVE-2020-0601=
, CVE-2020-7919)<br>
&gt; &gt;&gt; &gt; &gt;&gt; 6e1d159680 Update Golang 1.13.6<br>
&gt; &gt;&gt; &gt; &gt;&gt; 4241093b63 Update Golang 1.13.5<br>
&gt; &gt;&gt; &gt; &gt;&gt; 162fd8b856 Bump Golang 1.13.4<br>
&gt; &gt;&gt; &gt; &gt;&gt; 05a1ebd0fd Bump Golang 1.13.3 (CVE-2019-17596)=
<br>
&gt; &gt;&gt; &gt; &gt;&gt; f8d4276a89 bump golang 1.13.1 (CVE-2019-16276)=
<br>
&gt; &gt;&gt; &gt; &gt;&gt; 7df2d881f3 Bump Golang version 1.13.0<br>
&gt; &gt;&gt; &gt; &gt;&gt; fed832e224 Update to using alpine 3.10<br>
&gt; &gt;&gt; &gt; &gt;&gt; 4581499848 Switch to s390x Ubuntu 18.04<br>
&gt; &gt;&gt; &gt; &gt;&gt; f34a5b5af0 builder: fix concurrent map write<b=
r>
&gt; &gt;&gt; &gt; &gt;&gt; 0df114a8f8 Merge pull request #40779 from thaJ=
eztah/19.03_backport_unify_apis<br>
&gt; &gt;&gt; &gt; &gt;&gt; 9f5a5da4cb docs: add API versions v1.30 - v1.3=
7<br>
&gt; &gt;&gt; &gt; &gt;&gt; 037d5a9e9a Merge pull request #40769 from thaJ=
eztah/19.03_backport_seccomp_time64<br>
&gt; &gt;&gt; &gt; &gt;&gt; 5ed8f9a203 Merge pull request #40681 from thaJ=
eztah/19.03_backport_schema2v1_dep_notice_on_error_only<br>
&gt; &gt;&gt; &gt; &gt;&gt; 284bbde996 seccomp: add 64-bit time_t syscalls=
<br>
&gt; &gt;&gt; &gt; &gt;&gt; 43b0a73273 Merge pull request #40758 from thaJ=
eztah/19.03_backport_arm_matching<br>
&gt; &gt;&gt; &gt; &gt;&gt; 89f296a534 Merge pull request #40562 from thaJ=
eztah/19.03_backport_39353_subgid_subuid<br>
&gt; &gt;&gt; &gt; &gt;&gt; d12b6d24d1 Merge pull request #40628 from cpug=
uy83/19.03_backport_39360_swarm_log_fill_rate<br>
&gt; &gt;&gt; &gt; &gt;&gt; 359edd8cbf [19.03] vendor: containerd 481103c8=
793316c118d9f795cde18060847c370e<br>
&gt; &gt;&gt; &gt; &gt;&gt; 1454987253 Merge pull request #40617 from SamW=
hited/19.03<br>
&gt; &gt;&gt; &gt; &gt;&gt; 021258661b Update libnetwork and DNS library<b=
r>
&gt; &gt;&gt; &gt; &gt;&gt; 1db5199ddc Merge pull request #40564 from thaJ=
eztah/19.03_backport_apparmor_fixes<br>
&gt; &gt;&gt; &gt; &gt;&gt; 6ed0f6ab78 Merge pull request #40652 from thaJ=
eztah/19.03_backport_fix_backingfs<br>
&gt; &gt;&gt; &gt; &gt;&gt; 100d240d86 Move schema1 deprecation notice<br>
&gt; &gt;&gt; &gt; &gt;&gt; 4a4b3ed37f Merge pull request #40558 from thaJ=
eztah/19.03_backport_buster_or_bust<br>
&gt; &gt;&gt; &gt; &gt;&gt; 57d5105759 bump windows-container-utility aa1b=
a87e99b68e0113bd27ec26c60b88f9d4ccd9<br>
&gt; &gt;&gt; &gt; &gt;&gt; 68db0c1739 Dockerfile: switch to iptables-lega=
cy to match the host<br>
&gt; &gt;&gt; &gt; &gt;&gt; 4aaf3ead97 Dockerfile: switch golang image to =
&quot;buster&quot; variant, and update btrfs packages<br>
&gt; &gt;&gt; &gt; &gt;&gt; a070874828 hack/make: ignore failure to stop a=
pparmor<br>
&gt; &gt;&gt; &gt; &gt;&gt; 237843a059 Dockerfile: align consecutive COPY =
lines<br>
&gt; &gt;&gt; &gt; &gt;&gt; 400b2850ff Dockerfile: order COPY lines by cha=
nge frequency<br>
&gt; &gt;&gt; &gt; &gt;&gt; ddfeaf32ff Dockerfile: sort packages alphabeti=
cally<br>
&gt; &gt;&gt; &gt; &gt;&gt; cb813faebf Dockerfile: use build-arg for vpnki=
t<br>
&gt; &gt;&gt; &gt; &gt;&gt; 0499db23d1 Dockerfile: use spaces for indentat=
ion<br>
&gt; &gt;&gt; &gt; &gt;&gt; c77e7cb3d0 [19.03] Dockerfile: move CRIU_VERSI=
ON lower<br>
&gt; &gt;&gt; &gt; &gt;&gt; c6511ee4db bump vndr v0.1.1<br>
&gt; &gt;&gt; &gt; &gt;&gt; 0fa8a0c575 bump vndr v0.1.0 to support version=
ed import paths<br>
&gt; &gt;&gt; &gt; &gt;&gt; f3009e2f51 Use build args to override binary c=
ommits in dockerfile<br>
&gt; &gt;&gt; &gt; &gt;&gt; 92ca652fc9 Revert &quot;dockerfile: update vnd=
r to 85886e1a&quot;<br>
&gt; &gt;&gt; &gt; &gt;&gt; fdad16840c go-swagger: fix panic<br>
&gt; &gt;&gt; &gt; &gt;&gt; 075e057de5 Dockerfile: set GO111MODULE=3Doff<b=
r>
&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt; bnetwork:<br>
&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt; 026aaba Merge pull request #2567 from thaJezta=
h/19.03_backport_no_error<br>
&gt; &gt;&gt; &gt; &gt;&gt; 8565f0b log error instead if disabling IPv6 ro=
uter advertisement failed<br>
&gt; &gt;&gt; &gt; &gt;&gt; 86d159c Merge pull request #2565 from s0j/s0j_=
bump_19.03_fix-network-not-found<br>
&gt; &gt;&gt; &gt; &gt;&gt; bcb6dd6 Fix &#39;failed to get network during =
CreateEndpoint&#39;<br>
&gt; &gt;&gt; &gt; &gt;&gt; 153d076 bridge: disable IPv6 router advertisem=
ents<br>
&gt; &gt;&gt; &gt; &gt;&gt; 71d4d82 Merge pull request #2552 from thaJezta=
h/19.03_backport_fix_error_handline<br>
&gt; &gt;&gt; &gt; &gt;&gt; fdaaa02 Resolver: fix error handling if we did=
n&#39;t receive a response<br>
&gt; &gt;&gt; &gt; &gt;&gt; 7cf227c Merge pull request #2517 from thaJezta=
h/19.03_backport_bump_golang_1.13<br>
&gt; &gt;&gt; &gt; &gt;&gt; b9bcf0c Merge pull request #2545 from thaJezta=
h/19.03_backport_fix_npe_ep_iface<br>
&gt; &gt;&gt; &gt; &gt;&gt; b09f24d Fix NPE due to null value returned by =
ep.Iface()<br>
&gt; &gt;&gt; &gt; &gt;&gt; 0941c3f Merge pull request #2541 from SamWhite=
d/19.03_resolver_panic_backport<br>
&gt; &gt;&gt; &gt; &gt;&gt; 8068671 Fixes a panic in the DNS resolver<br>
&gt; &gt;&gt; &gt; &gt;&gt; 536ae72 Dockerfile: update to Go 1.13.8<br>
&gt; &gt;&gt; &gt; &gt;&gt; dcd9528 Fix gofmt in preparation of Go 1.13 up=
date<br>
&gt; &gt;&gt; &gt; &gt;&gt; f0b038e regenerate protobufs with debian buste=
r<br>
&gt; &gt;&gt; &gt; &gt;&gt; 34c8de5 Dockerfile: switch to debian &quot;bus=
ter&quot;<br>
&gt; &gt;&gt; &gt; &gt;&gt; 9660011 Dockerfile: update to Golang 1.12.17<b=
r>
&gt; &gt;&gt; &gt; &gt;&gt; 026aaba Merge pull request #2567 from thaJezta=
h/19.03_backport_no_error<br>
&gt; &gt;&gt; &gt; &gt;&gt; 8565f0b log error instead if disabling IPv6 ro=
uter advertisement failed<br>
&gt; &gt;&gt; &gt; &gt;&gt; 86d159c Merge pull request #2565 from s0j/s0j_=
bump_19.03_fix-network-not-found<br>
&gt; &gt;&gt; &gt; &gt;&gt; bcb6dd6 Fix &#39;failed to get network during =
CreateEndpoint&#39;<br>
&gt; &gt;&gt; &gt; &gt;&gt; 153d076 bridge: disable IPv6 router advertisem=
ents<br>
&gt; &gt;&gt; &gt; &gt;&gt; 71d4d82 Merge pull request #2552 from thaJezta=
h/19.03_backport_fix_error_handline<br>
&gt; &gt;&gt; &gt; &gt;&gt; fdaaa02 Resolver: fix error handling if we did=
n&#39;t receive a response<br>
&gt; &gt;&gt; &gt; &gt;&gt; 7cf227c Merge pull request #2517 from thaJezta=
h/19.03_backport_bump_golang_1.13<br>
&gt; &gt;&gt; &gt; &gt;&gt; b9bcf0c Merge pull request #2545 from thaJezta=
h/19.03_backport_fix_npe_ep_iface<br>
&gt; &gt;&gt; &gt; &gt;&gt; b09f24d Fix NPE due to null value returned by =
ep.Iface()<br>
&gt; &gt;&gt; &gt; &gt;&gt; 0941c3f Merge pull request #2541 from SamWhite=
d/19.03_resolver_panic_backport<br>
&gt; &gt;&gt; &gt; &gt;&gt; 8068671 Fixes a panic in the DNS resolver<br>
&gt; &gt;&gt; &gt; &gt;&gt; 536ae72 Dockerfile: update to Go 1.13.8<br>
&gt; &gt;&gt; &gt; &gt;&gt; dcd9528 Fix gofmt in preparation of Go 1.13 up=
date<br>
&gt; &gt;&gt; &gt; &gt;&gt; f0b038e regenerate protobufs with debian buste=
r<br>
&gt; &gt;&gt; &gt; &gt;&gt; 34c8de5 Dockerfile: switch to debian &quot;bus=
ter&quot;<br>
&gt; &gt;&gt; &gt; &gt;&gt; 9660011 Dockerfile: update to Golang 1.12.17<b=
r>
&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt; cli:<br>
&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt; 0ed913b88 Merge pull request #2592 from thaJez=
tah/19.03_backport_logout_config_out_of_sync2<br>
&gt; &gt;&gt; &gt; &gt;&gt; ab45dc8fd Merge pull request #2591 from thaJez=
tah/19.03_backport_docs_fixes2<br>
&gt; &gt;&gt; &gt; &gt;&gt; 0ed913b88 Merge pull request #2592 from thaJez=
tah/19.03_backport_logout_config_out_of_sync2<br>
&gt; &gt;&gt; &gt; &gt;&gt; ab45dc8fd Merge pull request #2591 from thaJez=
tah/19.03_backport_docs_fixes2<br>
&gt; &gt;&gt; &gt; &gt;&gt; 5a12f90b4 Don&#39;t filter out registries to l=
ogout from with config file contents<br>
&gt; &gt;&gt; &gt; &gt;&gt; 0ed913b88 Merge pull request #2592 from thaJez=
tah/19.03_backport_logout_config_out_of_sync2<br>
&gt; &gt;&gt; &gt; &gt;&gt; ab45dc8fd Merge pull request #2591 from thaJez=
tah/19.03_backport_docs_fixes2<br>
&gt; &gt;&gt; &gt; &gt;&gt; 5a12f90b4 Don&#39;t filter out registries to l=
ogout from with config file contents<br>
&gt; &gt;&gt; &gt; &gt;&gt; 521a636a8 Add MOBY_DISABLE_PIGZ to dockerd env=
ironment variable docs<br>
&gt; &gt;&gt; &gt; &gt;&gt; 8b8ec04cd Split up environment variable docume=
ntation between cli and dockerd<br>
&gt; &gt;&gt; &gt; &gt;&gt; 4e7c875e3 Fix broken link<br>
&gt; &gt;&gt; &gt; &gt;&gt; 2e6ff15da Merge pull request #2557 from thaJez=
tah/19.03_backport_fix_plugin_api_link<br>
&gt; &gt;&gt; &gt; &gt;&gt; f56d1b364 Merge pull request #2575 from thaJez=
tah/19.03_backport_bump_golang_1.13.12<br>
&gt; &gt;&gt; &gt; &gt;&gt; 8e7ff60ee Merge pull request #2589 from thaJez=
tah/19.03_backport_bump_x_text<br>
&gt; &gt;&gt; &gt; &gt;&gt; 6cb678f16 vendor: <a href=3D"http://golang.org=
/x/text" rel=3D"noreferrer" target=3D"_blank">golang.org/x/text</a> v0.3.3<=
br>
&gt; &gt;&gt; &gt; &gt;&gt; 4515c5187 vendor: <a href=3D"http://golang.org=
/x/text" rel=3D"noreferrer" target=3D"_blank">golang.org/x/text</a> v0.3.2<=
br>
&gt; &gt;&gt; &gt; &gt;&gt; 43a4e09bb Merge pull request #2586 from thaJez=
tah/19.03_backport_context_dont_loose_additional_fields<br>
&gt; &gt;&gt; &gt; &gt;&gt; cfa1fd9ac Don&#39;t loose additional metadata =
fields<br>
&gt; &gt;&gt; &gt; &gt;&gt; 6051b36db Merge pull request #2570 from thaJez=
tah/19.03_backport_hardcode_name_in_errors<br>
&gt; &gt;&gt; &gt; &gt;&gt; 31d338dd3 Bump Golang 1.13.12<br>
&gt; &gt;&gt; &gt; &gt;&gt; 9cc05b9ce Merge pull request #2548 from thaJez=
tah/19.03_backport_fix_dockerd_api_link<br>
&gt; &gt;&gt; &gt; &gt;&gt; 936d328da Use consistent name for errors<br>
&gt; &gt;&gt; &gt; &gt;&gt; dd360c7c0 Merge pull request #2558 from tiborv=
ass/19.03-expenv-panic<br>
&gt; &gt;&gt; &gt; &gt;&gt; 92b54c256 Merge pull request #2560 from tiborv=
ass/19.03-sshfix<br>
&gt; &gt;&gt; &gt; &gt;&gt; 2ee798198 ssh: avoid setting flags through hos=
tname<br>
&gt; &gt;&gt; &gt; &gt;&gt; e90b6bcb6 Fix bug with panic when DOCKER_CLI_E=
XPERIMENTAL environment variable is incorrect<br>
&gt; &gt;&gt; &gt; &gt;&gt; 97afb7295 docs/extend: fix broken link and som=
e markdown touch-ups<br>
&gt; &gt;&gt; &gt; &gt;&gt; c280cdfd6 docs: fix broken link in dockerd.md<=
br>
&gt; &gt;&gt; &gt; &gt;&gt; fd7874f16 Merge pull request #2532 from thaJez=
tah/19.03_backport_bump_golang_1.13.11<br>
&gt; &gt;&gt; &gt; &gt;&gt; a945f0e7e Merge pull request #2538 from silvin=
-lubecki/fix-version-old-engine-19-03<br>
&gt; &gt;&gt; &gt; &gt;&gt; 0f59532a1 Run e2e tests with different engine =
version on Jenkins Rewrite Jenkinsfile to new declarative syntax without pa=
rallel as the e2e framework is not tailored for than (container name clash,=
 port clash,...)<br>
&gt; &gt;&gt; &gt; &gt;&gt; 95df3499b Add a new Makefile variable to overr=
ide DockerInDocker engine version we use to run e2e tests<br>
&gt; &gt;&gt; &gt; &gt;&gt; 2d1476c6f Partially revert cf663b526a34f3e7911=
e6e60138138c2023aa844 as it breaks the version negotiation with an older do=
cker engine.<br>
&gt; &gt;&gt; &gt; &gt;&gt; 936e9717e Bump Golang 1.13.11<br>
&gt; &gt;&gt; &gt; &gt;&gt; ab108430b Merge pull request #2520 from thaJez=
tah/19.03_backport_markup_touch_ups<br>
&gt; &gt;&gt; &gt; &gt;&gt; 489c7e9cd docs: more Markdown touch-ups<br>
&gt; &gt;&gt; &gt; &gt;&gt; 1705e47cd Merge pull request #2508 from thaJez=
tah/19.03_backport_config_dont_init<br>
&gt; &gt;&gt; &gt; &gt;&gt; a9a83d2e7 Merge pull request #2516 from thaJez=
tah/19.03_backport_bump_klog<br>
&gt; &gt;&gt; &gt; &gt;&gt; ae2012cce Merge pull request #2518 from thaJez=
tah/19.03_backport_bump_pkg_errors<br>
&gt; &gt;&gt; &gt; &gt;&gt; 052a71c4d Merge pull request #2509 from thaJez=
tah/19.03_backport_docs_fixes<br>
&gt; &gt;&gt; &gt; &gt;&gt; 9a57ea886 Update some uses of errors.Cause() t=
o errors.Is()<br>
&gt; &gt;&gt; &gt; &gt;&gt; 345b0e79e vendor: pkg/errors v0.9.1<br>
&gt; &gt;&gt; &gt; &gt;&gt; 62a9babca vendor: <a href=3D"http://k8s.io/klo=
g" rel=3D"noreferrer" target=3D"_blank">k8s.io/klog</a> v1.0.0-2-g4ad0115<b=
r>
&gt; &gt;&gt; &gt; &gt;&gt; dbc73eafc docs: fix, and touch-up &quot;docker=
 context&quot; docs<br>
&gt; &gt;&gt; &gt; &gt;&gt; e06fc01c1 Update dead link and add missing inf=
o on COPY<br>
&gt; &gt;&gt; &gt; &gt;&gt; 8434242c7 config: don&#39;t call homedir on in=
it()<br>
&gt; &gt;&gt; &gt; &gt;&gt; bef0d567a Merge pull request #2493 from thaJez=
tah/19.03_backport_update_dockerd_usage<br>
&gt; &gt;&gt; &gt; &gt;&gt; 65c37227a docs: update usage output for docker=
d (19.03)<br>
&gt; &gt;&gt; &gt; &gt;&gt; 55a5ab0f0 docs: fix order of flags in usage, a=
nd fix missing quote<br>
&gt; &gt;&gt; &gt; &gt;&gt; a2d8a8a4c Merge pull request #2484 from thaJez=
tah/19.03_backport_fix_builder_link<br>
&gt; &gt;&gt; &gt; &gt;&gt; c150ba2b8 builder: fix broken link<br>
&gt; &gt;&gt; &gt; &gt;&gt; 392993336 Merge pull request #2457 from thaJez=
tah/19.03_backport_lazy_feature_detection<br>
&gt; &gt;&gt; &gt; &gt;&gt; 62baa3ce5 Merge pull request #2471 from thaJez=
tah/19.03_backport_fix_bind_panic<br>
&gt; &gt;&gt; &gt; &gt;&gt; 7a2de8165 Merge pull request #2470 from thaJez=
tah/19.03_backport_bump_yaml<br>
&gt; &gt;&gt; &gt; &gt;&gt; 0ea509c77 Merge pull request #2481 from thaJez=
tah/19.03_backport_fix_run_reference_links<br>
&gt; &gt;&gt; &gt; &gt;&gt; 81909d70f docs: fix links, and minor markdown =
touch-ups<br>
&gt; &gt;&gt; &gt; &gt;&gt; cf663b526 cli: perform feature detection lazil=
y<br>
&gt; &gt;&gt; &gt; &gt;&gt; c44c18e08 docker build: check experimental --p=
latform on pre-run<br>
&gt; &gt;&gt; &gt; &gt;&gt; 25f04876d app-214 Load Client info in getter f=
unction<br>
&gt; &gt;&gt; &gt; &gt;&gt; e470eef36 Merge pull request #2469 from thaJez=
tah/19.03_backport_docs<br>
&gt; &gt;&gt; &gt; &gt;&gt; 4ad65fc35 fix panic on single-character volume=
s<br>
&gt; &gt;&gt; &gt; &gt;&gt; 83d4cb900 vendor: bump <a href=3D"http://gopkg=
.in/yaml.v2" rel=3D"noreferrer" target=3D"_blank">gopkg.in/yaml.v2</a> v2.2=
.8<br>
&gt; &gt;&gt; &gt; &gt;&gt; 0cfe29431 service update: fix service create e=
xample<br>
&gt; &gt;&gt; &gt; &gt;&gt; 62baa3ce5 Merge pull request #2471 from thaJez=
tah/19.03_backport_fix_bind_panic<br>
&gt; &gt;&gt; &gt; &gt;&gt; 7a2de8165 Merge pull request #2470 from thaJez=
tah/19.03_backport_bump_yaml<br>
&gt; &gt;&gt; &gt; &gt;&gt; 0ea509c77 Merge pull request #2481 from thaJez=
tah/19.03_backport_fix_run_reference_links<br>
&gt; &gt;&gt; &gt; &gt;&gt; 81909d70f docs: fix links, and minor markdown =
touch-ups<br>
&gt; &gt;&gt; &gt; &gt;&gt; cf663b526 cli: perform feature detection lazil=
y<br>
&gt; &gt;&gt; &gt; &gt;&gt; c44c18e08 docker build: check experimental --p=
latform on pre-run<br>
&gt; &gt;&gt; &gt; &gt;&gt; 25f04876d app-214 Load Client info in getter f=
unction<br>
&gt; &gt;&gt; &gt; &gt;&gt; e470eef36 Merge pull request #2469 from thaJez=
tah/19.03_backport_docs<br>
&gt; &gt;&gt; &gt; &gt;&gt; 4ad65fc35 fix panic on single-character volume=
s<br>
&gt; &gt;&gt; &gt; &gt;&gt; 83d4cb900 vendor: bump <a href=3D"http://gopkg=
.in/yaml.v2" rel=3D"noreferrer" target=3D"_blank">gopkg.in/yaml.v2</a> v2.2=
.8<br>
&gt; &gt;&gt; &gt; &gt;&gt; 0cfe29431 service update: fix service create e=
xample<br>
&gt; &gt;&gt; &gt; &gt;&gt; 2dc593f67 Add container_iface_prefix option to=
 documentation<br>
&gt; &gt;&gt; &gt; &gt;&gt; d25e65734 Merge pull request #2445 from thaJez=
tah/19.03_backport_network_prune_improve_message<br>
&gt; &gt;&gt; &gt; &gt;&gt; 8986e3120 Merge pull request #2456 from thaJez=
tah/19.03_backport_gotest_v3<br>
&gt; &gt;&gt; &gt; &gt;&gt; 4fe6b837b bump gotest.tools v3.0.1 for compati=
bility with Go 1.14<br>
&gt; &gt;&gt; &gt; &gt;&gt; a8454a4d9 update vndr v0.1.1<br>
&gt; &gt;&gt; &gt; &gt;&gt; 950dcedd9 bump vndr v0.1.0 to support versione=
d import paths<br>
&gt; &gt;&gt; &gt; &gt;&gt; 05ad944d1 Merge pull request #2453 from thaJez=
tah/19.03_backport_fixup_markdown_and_links<br>
&gt; &gt;&gt; &gt; &gt;&gt; 0d26cbf5b yamldocs: add description to base co=
mmand<br>
&gt; &gt;&gt; &gt; &gt;&gt; d4e4fa3b4 experimental/vlan-networks: markdown=
 touch-ups<br>
&gt; &gt;&gt; &gt; &gt;&gt; de12dbfb1 docs/reference: explain &quot;colon&=
quot;<br>
&gt; &gt;&gt; &gt; &gt;&gt; 7ae77e51f docs/extend: reformat notes<br>
&gt; &gt;&gt; &gt; &gt;&gt; 733ae82da docs/builder: touch up markdown, and=
 some minor rephrasing<br>
&gt; &gt;&gt; &gt; &gt;&gt; 9a1ba7d39 docs/reference/run.md: touch-up mark=
down<br>
&gt; &gt;&gt; &gt; &gt;&gt; 6ba9a3e4c reference docs: reformat notes<br>
&gt; &gt;&gt; &gt; &gt;&gt; 96eb0888f reference docs: fix broken links and=
 markdown touch-ups<br>
&gt; &gt;&gt; &gt; &gt;&gt; 2676c603f Adding missing title in builder.md<b=
r>
&gt; &gt;&gt; &gt; &gt;&gt; 365bae4f8 Add clarification when using USER UI=
D:GI<br>
&gt; &gt;&gt; &gt; &gt;&gt; 04533bd52 Merge pull request #2442 from thaJez=
tah/19.03_backport_update_go_events<br>
&gt; &gt;&gt; &gt; &gt;&gt; c38b26007 improve &quot;network prune&quot; ou=
tput to mention custom networks only<br>
&gt; &gt;&gt; &gt; &gt;&gt; ba0a2ffe2 Merge pull request #2444 from thaJez=
tah/19.03_backport_host_gateway_validation<br>
&gt; &gt;&gt; &gt; &gt;&gt; fd9eedce3 Add &quot;host-gateway&quot; to test=
s for extra_hosts / --add-host<br>
&gt; &gt;&gt; &gt; &gt;&gt; 365118982 Skip IPAddr validation for &quot;hos=
t-gateway&quot; string<br>
&gt; &gt;&gt; &gt; &gt;&gt; a0f0ed1f5 vendor: update go-events to fix alig=
nment for 32bit systems<br>
&gt; &gt;&gt; &gt; &gt;&gt; 173c85ad7 Merge pull request #2431 from thaJez=
tah/19.03_backport_bump_golang_1.13.10<br>
&gt; &gt;&gt; &gt; &gt;&gt; de6a5fa44 Bump Golang 1.13.10<br>
&gt; &gt;&gt; &gt; &gt;&gt; 1a4749b8e Merge pull request #2435 from thaJez=
tah/19.03_backport_bump_certificates<br>
&gt; &gt;&gt; &gt; &gt;&gt; 19ccd4f5d CI: update notary test certificates<=
br>
&gt; &gt;&gt; &gt; &gt;&gt; d7f5f70c3 Merge pull request #2419 from thaJez=
tah/19.03_backport_bump_golang_1.13.9<br>
&gt; &gt;&gt; &gt; &gt;&gt; f8fc68f17 Bump Golang 1.13.9<br>
&gt; &gt;&gt; &gt; &gt;&gt; 7d4850005 Merge pull request #2403 from thaJez=
tah/19.03_backport_update_deprecation_policy<br>
&gt; &gt;&gt; &gt; &gt;&gt; 22cbf9161 Update deprecation policy to 1 stabl=
e release<br>
&gt; &gt;&gt; &gt; &gt;&gt; 0b0ea3f0f Merge pull request #2401 from thaJez=
tah/19.03_backport_deprecation_policy<br>
&gt; &gt;&gt; &gt; &gt;&gt; 288cdec29 Include deprecation policy on deprec=
ated features page<br>
&gt; &gt;&gt; &gt; &gt;&gt; a4d902af5 Merge pull request #2399 from thaJez=
tah/19.03_backport_remove_comments<br>
&gt; &gt;&gt; &gt; &gt;&gt; ffffc1ed4 remove unneeded comment from referen=
ce files<br>
&gt; &gt;&gt; &gt; &gt;&gt; bf1f5fcfb Merge pull request #2393 from thaJez=
tah/19.03_backport_codehints_compatibility<br>
&gt; &gt;&gt; &gt; &gt;&gt; c35400655 Merge pull request #2391 from thaJez=
tah/19.03_backport_fix_yamldocs<br>
&gt; &gt;&gt; &gt; &gt;&gt; 9fd323afd Fix whitespace that caused short-for=
mat in generated YAML<br>
&gt; &gt;&gt; &gt; &gt;&gt; c936ea969 Fix yamldocs generator to accomodate=
 nested subcommands<br>
&gt; &gt;&gt; &gt; &gt;&gt; d484456c2 Fix naming of reference docs files<b=
r>
&gt; &gt;&gt; &gt; &gt;&gt; 6a02465f4 docs: update code-hints for compatib=
ility with &quot;rouge&quot;<br>
&gt; &gt;&gt; &gt; &gt;&gt; f53663a95 Merge pull request #2364 from thaJez=
tah/19.03_backport_bump_golang_1.13<br>
&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt; Testing has been performed across x86-64/arm v=
ia cli and docker-compose.<br>
&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:=
ming.liu@toradex.com" target=3D"_blank">ming.liu@toradex.com</a>&gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt; ---<br>
&gt; &gt;&gt; &gt; &gt;&gt;=C2=A0 recipes-containers/docker/<a href=3D"htt=
p://docker-moby.bb" rel=3D"noreferrer" target=3D"_blank">docker-moby.bb</a>=
 | 8 ++++----<br>
&gt; &gt;&gt; &gt; &gt;&gt;=C2=A0 1 file changed, 4 insertions(+), 4 delet=
ions(-)<br>
&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt; diff --git a/recipes-containers/docker/<a href=
=
=3D"http://docker-moby.bb" rel=3D"noreferrer" target=3D"_blank">docker-mob=
y.bb</a> b/recipes-containers/docker/<a href=3D"http://docker-moby.bb" rel=
=3D"noreferrer" target=3D"_blank">docker-moby.bb</a><br>
&gt; &gt;&gt; &gt; &gt;&gt; index 074ef08..634e5c0 100644<br>
&gt; &gt;&gt; &gt; &gt;&gt; --- a/recipes-containers/docker/<a href=3D"htt=
p://docker-moby.bb" rel=3D"noreferrer" target=3D"_blank">docker-moby.bb</a>=
<br>
&gt; &gt;&gt; &gt; &gt;&gt; +++ b/recipes-containers/docker/<a href=3D"htt=
p://docker-moby.bb" rel=3D"noreferrer" target=3D"_blank">docker-moby.bb</a>=
<br>
&gt; &gt;&gt; &gt; &gt;&gt; @@ -35,9 +35,9 @@ DESCRIPTION =3D &quot;Linux =
container runtime \<br>
&gt; &gt;&gt; &gt; &gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0to a docker.inc rec=
ipe<br>
&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt;=C2=A0 # moby commit matches the docker-engine =
bump on the 19.03 branch&#39;<br>
&gt; &gt;&gt; &gt; &gt;&gt; -SRCREV_moby =3D &quot;aa6a9891b09cce3d9004121=
294301a30d45d998d&quot;<br>
&gt; &gt;&gt; &gt; &gt;&gt; -SRCREV_libnetwork =3D &quot;c7bae399e46fd620b=
8a006174b7327e4e6e647fd&quot;<br>
&gt; &gt;&gt; &gt; &gt;&gt; -SRCREV_cli =3D &quot;eb310fca49568dccd87c6136=
f774ef6fff2a1b51&quot;<br>
&gt; &gt;&gt; &gt; &gt;&gt; +SRCREV_moby =3D &quot;9dc6525e6118a25fab2be32=
2d1914740ea842495&quot;<br>
&gt; &gt;&gt; &gt; &gt;&gt; +SRCREV_libnetwork =3D &quot;026aabaa659832804=
b01754aaadd2c0f420c68b6&quot;<br>
&gt; &gt;&gt; &gt; &gt;&gt; +SRCREV_cli =3D &quot;0ed913b885c8919944a2e4c8=
d0b80a318a8dd48b&quot;<br>
&gt; &gt;&gt; &gt; &gt;&gt;=C2=A0 SRC_URI =3D &quot;\<br>
&gt; &gt;&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=
=
=3D"http://github.com/moby/moby.git;branch=3D19.03;name=3Dmoby" rel=3D"nor=
eferrer" target=3D"_blank">github.com/moby/moby.git;branch=3D19.03;name=3Dm=
oby</a> \<br>
&gt; &gt;&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=
=
=3D"http://github.com/docker/libnetwork.git;branch=3Dbump_19.03;name=3Dlib=
network;destsuffix=3Dgit/libnetwork" rel=3D"noreferrer" target=3D"_blank">g=
ithub.com/docker/libnetwork.git;branch=3Dbump_19.03;name=3Dlibnetwork;dests=
uffix=3Dgit/libnetwork</a> \<br>
&gt; &gt;&gt; &gt; &gt;&gt; @@ -57,7 +57,7 @@ GO_IMPORT =3D &quot;import&q=
uot;<br>
&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt; -DOCKER_VERSION =3D &quot;19.03.8&quot;<br>
&gt; &gt;&gt; &gt; &gt;&gt; +DOCKER_VERSION =3D &quot;19.03.12&quot;<br>
&gt; &gt;&gt; &gt; &gt;&gt;=C2=A0 PV =3D &quot;${DOCKER_VERSION}+git${SRCR=
EV_moby}&quot;<br>
&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt;=C2=A0 PACKAGES =3D+ &quot;${PN}-contrib&quot;<=
br>
&gt; &gt;&gt; &gt; &gt;&gt; --<br>
&gt; &gt;&gt; &gt; &gt;&gt; 2.27.0<br>
&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; --<br>
&gt; &gt;&gt; &gt; - Thou shalt not follow the NULL pointer, for chaos and=
 madness await<br>
&gt; &gt;&gt; &gt; thee at its end<br>
&gt; &gt;&gt; &gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek =
II<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; - Thou shalt not follow the NULL pointer, for chaos and madn=
ess await<br>
&gt; &gt;&gt; thee at its end<br>
&gt; &gt;&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br=
>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await=
<br>
&gt; thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt; <br>
<br>
<br>
<br>
--<br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>

--000000000000e9d0ce05a9063d20--
