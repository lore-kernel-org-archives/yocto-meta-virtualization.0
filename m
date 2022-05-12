Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1416C433F5
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 04:02:19 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web08.333.1652328136842201131
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 May 2022 21:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H+ylbckW;
 spf=pass (domain: gmail.com, ip: 209.85.160.172,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id hh4so3481242qtb.10
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 May 2022 21:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6mfHOnH8FyiWbal5oI1NFRI7DMg1ro0xzyHWBjtV7go=;
        b=H+ylbckW1ZlAsoJ5Lc3qjuRODoAV0hGC17tOtn4ulMO7upmTqE8wK/lG027wlP54DX
         INsTR7D6EifqpbnpoRHDFT86+9z1EcfQ8eBJa2W9NSqiEmAdDbHrBSKUhGllOL6wolay
         aIIEg/BcfCb/P/MYrBKxxC2Nv0Sy4OYRV4UVAZz70TRF7yTM9Vi/LB5QBMLnrqzg5Zql
         qkI+aKiK+BmDECuALmF51B0lAAMBuM+CZzbuyz3OtbKcPNeXzB3xOvprgsKhnDGMn/KN
         Y9nJKF7wO9tTvNAsceoJI5hryySnFO7aViBfFUJVUnomazobxK5uxQJeDib9+sCSQPa6
         jweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6mfHOnH8FyiWbal5oI1NFRI7DMg1ro0xzyHWBjtV7go=;
        b=znyn5v1FzOrO7VW/mugdsY1sRpVySg7aIT5GX54DH4+kZsJAxcC7UkFRrvnHISjQuf
         QQZyJ+yNPHQUx1xjoJtPo7gH0hUpS/OWMHO7je+f+823HijI7Bs3+MM5zgQMAvytrcBQ
         b2p4/7yXjSjXjjNfy4sGM8J+goCHjZnhTgYEmvQjEWEbkw3PwJFCGV4uFwJzPLH+WF6T
         6Yh13+YyADu+MMCBhFjHrutWfHjzvGtucqilsOaifdmmROsZpUxo+jnSi7pFyc8r3tjp
         1JCpVplGRTbIYokET/CtvNCDj0YXgi/DKoh456lU+3og0jqGNGSFGEbSZYjaELVObhY8
         CXow==
X-Gm-Message-State: AOAM533GTj1eE3vSFtb2r3uQETqKnn9Rtg/kpJD1v9NnzLVdLngLaBf7
	k6JHq38ErIfDLuP53/tgL+6uoIB4JIcGmA==
X-Google-Smtp-Source: 
 ABdhPJzVMfkTK0rrYDfaMjolwlWIfH+NhkZtOJCjyjRH1KJ3vP8CVdDDe1BBS2yJglYC8DKUdASaOQ==
X-Received: by 2002:a05:622a:309:b0:2f3:b965:f1d with SMTP id
 q9-20020a05622a030900b002f3b9650f1dmr27010797qtw.314.1652328135726;
        Wed, 11 May 2022 21:02:15 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 p6-20020a05620a056600b0069fc13ce226sm2332376qkp.87.2022.05.11.21.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 21:02:14 -0700 (PDT)
Date: Thu, 12 May 2022 00:02:13 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] criu: Upgrade to 3.17 to fix
 restore and fix build
Message-ID: <20220512040211.GA18930@gmail.com>
References: <20220510030959.2379387-1-zhe.he@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510030959.2379387-1-zhe.he@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 12 May 2022 04:02:19 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7276

merged.

Bruce

In message: [meta-virtualization][PATCH] criu: Upgrade to 3.17 to fix restore and fix build
on 10/05/2022 He Zhe wrote:

> - To fix restore Segmentation fault
> criu restore -d -D checkpoint
> 8306: Error (criu/cr-restore.c:1480): 8331 killed by signal 11: Segmentation fault
> Error (criu/cr-restore.c:2447): Restoring FAILED.
> 
> - Inherit pkgconfig to fix build warning
> pkg-config not found
> 
> - Define PLUGINDIR when doing instll to fix build failure
> mkdir: cannot create directory '/var/lib/criu': Permission denied
> 
> New commits since 3.16.1:
> 
> 4f8f295e5 criu: Version 3.17
> 991f27c84 ci: skip new hugetlb maps09/maps10 tests for pre-dump
> 0c1f0256f kerndat: handle the case when hugetlb isn't supported
> 17a19676c zdtm: handle the case when hugetlb isn't supported
> c1380c077 ci: workaround race between sit module loading and bridge test
> 550eafc5d ci: print kernel modules list
> f635b61f4 test: install criu in /usr
> 2f0f12839 readme: Add badge links to workflows
> d14dbb8c7 sk-unix: rework bind_on_deleted() return codes
> 5b872c718 proc_parse: Fix parsing bpf map_extra
> d40b332ce bpf: update deprecated API
> f641e0c4b ci: print mountinfo instead of mount cmd output
> 5c0b4fbcd ci: criu-fault: skip inotify_irmap fault-injection on btrfs
> 7ac85cab8 scripts/ci: fix ZDTM_OPTS variable passing
> ead227994 zdtm: temporary disable rseq02 test
> db9ec1361 zdtm: add rseq02 transition test with NO_RESTART CS flag
> 1e0bed3d6 rseq: handle rseq/rseq_cs flags properly
> 13338dee5 Revert "test: disable rseq also on Archlinux"
> 064e9925a zdtm: add transition/rseq01 test for amd64
> 2d3354e7b cr-dump: fixup thread IP when inside rseq cs
> 4c7ece0bb compel: add helpers to get/set instruction pointer
> 441310c26 zdtm/static/rseq00: fix rseq test when linking with a fresh Glibc
> f70ddab24 pie/restorer: unregister (g)libc rseq before memory restoration
> e1799e530 include: add thread_pointer.h from Glibc
> 267c1fdad ci: add Fedora Rawhide based test on Cirrus
> 03aff7e82 Revert "ci: disable glibc rseq support"
> 51e0d3e29 zdtm: add basic static/rseq00 test for rseq C/R
> c5162cef5 rseq: fail dump if rseq is used but host doesn't support get_rseq_conf feature
> f81e3062c rseq: initial support
> bd9ee3255 cr-check: Add ptrace rseq conf dump feature
> ca54dfcac util: move fork_and_ptrace_attach helper from cr-check
> 8b3a76b64 kerndat: check for rseq syscall support
> de03eb435 compel: add rseq syscall into compel std plugin syscall tables
> 4adec8e8e cgroup: test for --manage-cgroups=ignore
> 2b6901707 cgroup: fix --manage-cgroups=ignore
> c71d4a54a cgroup: fix "unified" path
> 8ddd7f483 ci: add codespell to lint target
> e7b1c8579 Fix remaining codespell warnings
> 0194ed392 Fix some codespell warnings
> 3f1800477 Add .codespellrc
> f16976c03 test/zdtm.py: rename a var
> fab46c310 test/exhaustive/unix.py: rename a var
> 2a60b4974 Rename useable to usable
> c4bdde213 criu/mount.c: separate \t
> 51837a65e criu/files.c: some renames
> bd3a21e0b test/javaTests: rename ser to s
> 777ad1966 Nit: rename sie to se
> 716e56f37 Typo: mmaped -> mmapped
> d9411c948 test/zdtm/static: s/NODEL/NO_DEL/
> 58d76cb16 test/zdtm/static/inotify_system.c: s/inot/infd/
> 0cb8b9c04 test/zdtm/static: use param not parm
> 58b120b06 criu/pie/restorer.c: use param not parm
> 747ec75d9 criu/arch/s390/include/asm/restorer.h: fix comments
> 8bb05e3bf ci: Switch to non overlaysfs tests
> 45e048d77 criu: generate unique socket names
> 75064b742 mount: fix -Wunused-but-set-variable for Clang 15
> 46e4773c3 style: delete some redundant code
> 5109fccf8 apparmor: Fix -Wfortify-source for Clang
> 791651f1b criu-ns: add a helper to hold a pid namespace
> 805559c1d scripts/ci: mount test cgroups once
> ab6191ccd zdtm: use unique holder for cgroups
> 73a783ac1 mount: make error messages differ in different places
> 165d5a2cd mount-v2: make mount engine fallback messages loglevel debug
> 8867840c8 zdtm/mount-v2: disable pty-console test
> c8121ed74 test/jenkins: test for old mount engine
> 3c0e99ccf ci: make others/mnt_ext_dev also run for old mount engine
> 642abd133 zdtm/mount-v2: disable mnt_tracefs test
> f736d88c9 zdtm: add propagation group with mount flags to mount_complex_sharing
> ef53df471 zdtm: add mount_complex_sharing test
> 486e1fd85 zdtm: add new mnt_ext_sharing test for mount-v2
> 3db949d82 ci: run tests for old mount engine
> 8d6e2d044 zdtm: enable mounts compat mode on restore with --mntns-compat-mode option
> b35c842d0 mount: add new mounts-v2 engine
> c29675c9a mount: export global variables for mount-v2
> 972a59862 mount: export several functions for mount-v2
> 3229e7f58 mount: export common defines for mount-v2
> 0723d0cd9 mount: remove double ns_id declaration
> 1f4a9a531 files-reg: export parent dirs helpers for mount-v2
> f032741cd mount: add plain mountpoints
> f2d1c7fab config/rpc: add new option --mntns-compat-mode for old mount engine
> f6b52c711 crtools: move check_options after kerndat_init and log_init
> 6a25420d3 util: add resolve_mountpoint helper
> cef8366f5 kerndat: check whether the openat2 syscall is supported
> 387f4652b compel: add open_tree syscall
> a946b946e kerndat: Check for MOVE_MOUNT_SET_GROUP availability
> 0ca89b99b files-reg: teach clean_one_remap to work with mount-v2
> 9a0918497 files-reg: teach create_ghost to work with mount-v2
> 169f95c39 files-reg: split create_ghost_dentry out of create_ghost
> 9fb3984a7 mount: add service_mountpoint getter for ->mountpoint
> 65967a84b mount: use ns_mountpoint instead of mountpoint where possible
> eedbc6f47 mount: use ns_mountpoint in mnt_depth
> ae0b218c3 mount: use ns_mountpoint in aufs_parse
> 7b968ceea mount: use ns_mountpoint in collect_mntinfo
> f2bf6597c path: simplify mnt_get_sibling_path via get_relative_path
> abbc70adc mount: use ns_mountpoint for children-overmount check
> c17695cb1 mount: use ns_mountpoint in root_path_from_parent
> 010295b8f mount: use ns_mountpoint in validate_children_collision
> 07eb01593 mount: skip root yard children from mnt_needs_remap check
> e8de10a4f mount: use ns_mountpoint in mnt_is_overmounted
> b954e5136 autofs: use ns_mountpoint in autofs_create_dentries
> 7a67949e5 mount: make general place for shared variables on mount-info on restore
> 0c41c1187 mount: fix broken remounted_rw check
> 718247045 mount: move root yard tree merge as early as possible
> 770cdbfb9 mount: prepare is_overmounted as early as possible
> 83bbf1b05 mount: add helper mnt_get_external_bind_nodev
> 0fd0e03a2 mount: do not override master_id to -1 for root binds
> 4f156f32b mount: put external slavery mounts to separate mnt_ext_slave list
> ef79912c1 mount: add can_receive_master_from_root helper
> b52fcb284 mount: replace CRTIME_MNT_ID with HELPER_MNT_ID
> 4736a7240 mount/restore: leave ns_mountpoint NULL for aux binfmt_misc mount
> 16085b5e6 mount/restore: create auxiliary binfmt_misc mount in the root yard
> a379d4d94 zdtm: add mntns_pivot_root_ro test
> 2a3d2bc28 mount: apply superblock flags to nested ns roots
> 77f67973f zdtm: add mntns_pivot_root test
> 2fdb4993a mount: allow nested mount namespaces with different roots
> cf6fe2d48 mount: add mnt_is_root_bind helper
> e50abbd3b zdtm: add mnt_ext_collision test
> a963ceb77 mount: restrict mp-external mount map to init container mntns only
> 007501f98 zdtm: add new mnt_ext_root test
> 4f9414934 mount: mount external mount before mounting it's binds
> d5cb7764e mount: show more info about why we can't mount
> 685a53eec mount: rework skipping external mounts in dump_one_mountpoint
> 3b2b80812 mount: split mnt_is_external(_bind) and can_receive_master_from_external
> c09bd8941 mount: add mnt_bind_pick helper to pick the desired bind
> 9d1f39f28 unittest: add some tests for get_relative_path helper
> 97bd9511c util: add get_relative_path helper
> 261b7a8fd mount: setup mnt_bind list before using it in mnt_is_external
> 30261a751 mount: skip fstype and source checks for external mounts in mounts_sb_equal
> 8d5300aa9 mount: mark mounts of external devices external
> e17c1cc12 mount: do not detect non-fsroot mounts as device-external
> eda1e5fdb mount: add mntinfo_add_list_before helper for adding to mntinfo list
> 9649356e3 zdtm: fix mnt_ext_master test to correspond to it's name
> 5a8fd343f uffd: fix __u64 print format specifier
> 9e7473516 sk-unix: fix e_str leak in unix_sk_id_add
> 87d373514 criu/plugin: Add support for criu image streamer
> 55370b720 criu/plugin: Store BO contents directly to file
> ecdf740fa criu/plugin: Add whitepaper document
> 99a2380fc criu/plugin: Dockerfile for amdgpu_plugin
> 2095de9f0 criu/plugin: Fix for FDs not allowed to mmap
> bd8333009 criu/plugin: Implement sDMA based buffer access
> 6d7926622 criu/plugin: Restore libhsakmt shared memory files
> a218fe0ba criu/plugin: Read and write BO contents in parallel
> ba9c62df2 criu/plugin: Add unit tests for GPU remapping
> 4856e0d4d criu/plugin: Add parameters to override mapping
> 72905c9c9 criu/plugin: Remap GPUs on checkpoint restore
> 6e99fea2f criu/plugin: Implement system topology parsing
> c4e3ac7fe criu/plugin: Adding check for kernel IOCTL version
> 55a5993bc criu/plugin: Support AMD ROCm Checkpoint Restore with KFD
> 71ff9cc04 criu/plugin: Initialize AMD KFD header
> 91157315b criu/plugin: Skip plugin vmas during premap
> 63e127fc8 criu/plugin: Add dedicated flag for plugins
> e04db0241 criu/files: Add function to return unused FD by pid
> 653eefea0 criu/plugin: Do not reopen vma fd for plugins
> 5b0a639a5 files: fix inh leak in inherit_fd_add
> 060567042 net: fix e_str leak in veth_pair_add
> 2856d06e3 config: fix ns leak in parse_join_ns
> a8dd7d290 ci: run criu-config tests
> 1c54c45fc zdtm: drop redundant config_inotify_irmap test
> d2073cd4d zdtm: add --criu-config option
> fc38a01e5 zdtm: use long form cli options
> 0734fc807 zdtm: sort import lines
> 0b7965397 zdtm: refactor main
> 1b4a9df9c sk-unix: fix uint32_t id variable printf format specifier
> 09fa32a75 tun: fix tun_link leak in dump_tun_link
> 7e9a9dc34 cr-dump: fix cr_imgset leak in dump_one_task
> 2747bb2a7 mount: fix e_str leak in ext_mount_add
> be78b853d proc_smaps: remove useless nonlinear check
> 97a998567 compel: set mxcsr during error injection to zero
> ef98a71b1 zdtm: fix missplacement of err=True
> 6b842635b test: disable rseq also on Archlinux
> 51099d2bb test: remove test for LOCK_MAND flock
> 247cdc90d bpfmap: handle new field in fdinfo
> 56df8aeeb ci: skip MAP_HUGETLB tests in stream test
> 2dc6d146b zdtm: Add MAP_HUGETLB mappings test for parent-child relationship processes
> 87a5694b4 zdtm: Add shm hugetlb test
> d22e472cf zdtm: Add memfd hugetlb test
> ffa268896 zdtm: Add MAP_HUGETLB memory mapping test
> a26b692c4 uffd: Skip lazy-mode restore on hugetlb mappings
> 456e50b59 mem: Skip premapping hugetlb mapping
> 8941b63a4 proc_parse, files: Add support for hugetlb memory mapping
> e4fb1dd5f memfd, shmem: Add support for checkpoint/restore memfd and anon shared memory
> 4d77b19eb ipc: Add support for checkpoint/restore hugetlb System V shared memory
> f69c36591 kerndat: Collect hugetlb device numbers
> 9c7bbfa69 check: Add a check for using memfd with hugetlb
> e8087fcff files: generate unique transport socket names
> 408a7d82d util: add an unique ID of the current criu run
> b13b95e52 compel: fix how PTRACE_GET_THREAD_AREA errors are handled
> b2ba14a15 restorer: Fix sys_mmap's returned value check
> 7177938e6 criu-ns: use os.waitstatus_to_exitcode()
> bb1b1681a criu-ns: fix exit code o for criu dump
> fdf4fda20 pstree: when updating sid for shell job also update matching pgid
> 89267dbcc ci: install libbsd dependency
> 48d53b699 Fix formatting in criu documentation
> 73d6a2c0e test/autofs: fix use-after-free
> 4d31105c7 ci: set continue-on-error for cross-compile
> 0568889ee compel: fix parasite with GCC 12
> db352ca48 criu: fix configuration file scanner with GCC 12
> bf6975c3e compel: fix GCC 12 failure (out of bounds)
> 6be10a232 zdtm: fix zdtm/static/maps00 case in arm64
> 6cfad77f0 pagemap: tiny fix on truncating memory image
> 908e5dd95 lib: added tests for feature check in libcriu
> b00b61f0e lib: introduce feature check in libcriu
> 4c4b2159d ci: added .lgtm.yml file
> 7f4265dc0 ci: update to latest Vagrant and Fedora images
> 7400d91f8 contributing: remove old badges and logo
> 29e221bb7 readme: add docker test badge
> 6f9d62eb3 ci: test criu-image-streamer with all tests
> 8ec214d3c mount/btrfs: make check_mountpoint_fd fallback to get_sdev_from_fd
> bbf5f642d proc_parse: add helper to resolve sdev from fd
> 15c42696c mount: remove mnt_fd argument of __open_mountpoint
> 1e7c62047 mount: split check_mountpoint_fd from __open_mountpoint
> 1b912802d zdtm/static/uffd-events: add more log messages
> ebd03383f zdtm: print tails of all logs if a test has failed
> f65098746 test: log testname.out.inprogress if a test has failed
> 8775cf3a5 ci: reenable the lazy-thp test in the lazy-remote mode
> c59abfa81 page-xfer: stop waiting for a new command after a close command
> 13b726ebc tls: allow to terminate connections synchronously
> 73d1d0769 uffd: call disconnect_from_page_server to shutdown a page-server connection
> 4fdf3db31 tls: add more comments
> 5a2250b1a tls: use ssize_t for return value
> 89e8e8e69 tls: fix typo
> 0da88b6da zdtm: Add SOCK_SEQPACKET variants to unix socket tests
> 530ad9c89 sk-unix: Add support for SOCK_SEQPACKET unix sockets
> 3d618d0f4 crtools: check that cpuinfo command has sub-command
> 233f1f1d0 crtools: use new opts.mode in image_dir_mode
> 3fa85bcdc crtools/rpc: export current criu mode to opts.mode
> 1b015df9b crtools: remove excess always true condition
> be092e25a zdtm: remove mntns-deleted-dst test leftover from git
> f92c7f1af zdtm: zdtm_ct fix compilation error with strict-prototypes on
> e62e05c2d zdtm.py: clean up MAKEFLAGS env variable before running make instance
> af4b26519 tests: added test for single pre-dump support
> 51a1adbc0 libcriu: add single pre-dump support
> 119a79885 ci: disable glibc rseq support
> 9fd000c58 ci: use unstable release for cross-compile
> 0e04a3c6a libcriu: add setting lsm-mount-context to libcriu
> af298353d usernsd: UNS_FDOUT should not require an input descriptor
> efe5d9a12 Add documentation for --timeout option
> 583e8ca05 ci: enable x86 xsave fault injection tests back
> 1ba443982 x86/compel/fault-inject: print the initial seed
> fc1eb01ff x86/compel/fault-inject: bound xsave features set
> 6186bfa0c test: another try to correctly fix the kernel version
> d79d73e3a ci: install procps in Alpine
> 3eba68089 ci: Enable disabled unix socket related tests
> 94111596f sk-unix: Fix TCP_ESTABLISHED checks in unix sockets
> 6930d6a32 util: make page-server IPv6 safe
> d57f27bc9 files-reg: try dump_ghost_remap if link-remap failed with error ENOENT
> 14075baf7 test: do not use --keep-going for single zdtm tests
> a52185ffe ci: disable broken tests until fixed
> 4ab2facb2 make: Explicitly enable FPU on ARMv7 builds
> d514bacb4 ci: Run cross compile with debian testing
> 4c1330bb0 ci: Run cross compile on debian stable
> 718eb06be clang-format: disable wrong struct pointer declaration format
> 858002483 zdtm: add ro-mount check after c/r to mntns_ghost01
> 17357d67f files-reg: temporary remount writable the mount we do unlink on
> bd219b69a ghost/mount: allocate remounted_rw in shmem to get info from other processes
> cfed6f35e files-reg: fix error handling of rm_parent_dirs
> 5a0943c90 files-reg: fix error handling in open_path
> 64b58b514 check: cleanup child processes
> 156cce78c ci: switch to centos-stream-8
> c2fd81903 crtools: ignore SIGPIPE in swrk mode
> a491706cc ci: Use latest Fedora for lint ci runs again
> eb0dee408 seize: restore cgroup freezer to right state
> 781676f10 clang-format/zdtm: fix clang complains about strange elseifs
> d2b6faf8f tests: improve the deterministic behavior of the test suite
> 94092ce00 zdtm.py: make tests with --link_remap exclusive
> 1f9e2c420 ci: disable socket-raw test on centos8
> a9d9fb8aa clang-format: make x86_ins_capability_mask human-readable
> 4ff252656 cr-dump: fail dumping when zombie process with sid 0
> 26db7adbb clang-format: do automatic comment fixups
> 206479322 clang-format: do several manual comment fixups
> bbfd9031a clang-format: enable AlignTrailingComments
> 718f4cae2 zdtm: make sock_opts02 also check lock change by SO_*BUF*
> 3a875cc4c zdtm: add test for socket buffer size locks
> e69be16db sockets: c/r bufer size locks
> ce5ce285a kerndat: check for set/getsockopt SO_BUF_LOCK availability
> 2bd709664 sockets: don't call sk_setbufs asyncronously
> 37a8090d8 tests: improve the image streamer process control
> dae0704b6 ci: use Fedora 34 for lint CI runs
> f7bc3bdc9 ci: fix userfaultfd test failures
> d17eb325c ci: replace deprecated codecov bash uploader
> c1659c386 net: optimize restore_rule() to not open the CR_FD_RULE image file twice
> e3a853ab9 criu-ns: make pidns init first do setsid
> c750e62ca util: use nftw in rmrf helper
> 485a83c11 tty: fix the null pointer of get_tty_driver
> 7ba4d3bf1 pie/restorer: remove excess hash printf specifier
> bffaa7d07 ci: enable coredump tests
> bf8382a80 make: enable lint for coredump
> 8aa769455 test/coredump: fix shellcheck errors
> 0b3cf5c9e coredump: lint fix visually indented line
> 3a689ed9a coredump: fix comparison to true
> c1eab7d06 coredump: fix too many blank lines
> baad88d5e coredump: fix missing whitespace around operator
> 579066633 coredump: lint fix for block comments
> 06306c8b1 coredump: drop exec permission
> 1b368238b coredump: drop unused variable
> a92a7887a python: replace equality with identity test
> c71a81a6b coredump: convert indentation to spaces
> bf8a3c9f6 coredump: sort imports
> a0b738cb8 coredump: remove unused import
> 1c866dbb5 Add new files for running criu-coredump via python 2 or 3
> 3180d35fa Add support for python3 in criu-coredump
> f24360658 criu(8): Add more detailed description about --tcp-close dump option
> abf6b15c1 zdtm: Dumping/restoring with --tcp-close on TCP_CLOSE socket
> 795973055 tcp: Skip restoring TCP state when dumping with --tcp-close
> 74d1233b5 criu/files: Don't cache fd ids for device files
> 7b6239b6d criu/plugin: Implement dummy amdgpu plugin hooks
> 17e2a8c70 criu: Introduce new device file plugin hooks
> dd46e7919 criu(8): add --external net option
> be239109a github: update the stale version
> 
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  recipes-containers/criu/criu_git.bb | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
> index 7d98dd13..4b616ccf 100644
> --- a/recipes-containers/criu/criu_git.bb
> +++ b/recipes-containers/criu/criu_git.bb
> @@ -13,8 +13,8 @@ EXCLUDE_FROM_WORLD = "1"
>  
>  LIC_FILES_CHKSUM = "file://COPYING;md5=412de458544c1cb6a2b512cd399286e2"
>  
> -SRCREV = "4a1731891e91e62f15c40c361aff2a8a54d91bb3"
> -PV = "3.16.1+git${SRCPV}"
> +SRCREV = "4f8f295e57e68740699479d12c1ad251e6dd859f"
> +PV = "3.17+git${SRCPV}"
>  
>  SRC_URI = "git://github.com/checkpoint-restore/criu.git;branch=master;protocol=https \
>             file://0002-criu-Skip-documentation-install.patch \
> @@ -55,6 +55,7 @@ export HOST_SYS
>  export HOSTCFLAGS = "${BUILD_CFLAGS}"
>  
>  inherit setuptools3
> +inherit pkgconfig
>  
>  B = "${S}"
>  
> @@ -74,7 +75,7 @@ do_compile () {
>  
>  do_install () {
>      export INSTALL_LIB="${libdir}/${PYTHON_DIR}/site-packages"
> -    oe_runmake PREFIX=${exec_prefix} LIBDIR=${libdir} DESTDIR="${D}" FULL_PYTHON=${PYTHON} PYTHON=python3 install
> +    oe_runmake PREFIX=${exec_prefix} LIBDIR=${libdir} DESTDIR="${D}" PLUGINDIR="${localstatedir}/lib" FULL_PYTHON=${PYTHON} PYTHON=python3 install
>  
>      # python3's distutils has a feature of rewriting the interpeter on setup installed
>      # scripts. 'crit' is one of those scripts. The "executable" or "e" option to the
> -- 
> 2.32.0
> 

