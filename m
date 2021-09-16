Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web12.4669.1631830071694839394
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Sep 2021 15:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Uy4EWenI;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id u21so7027840qtw.8
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Sep 2021 15:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VMQVzT8ljZTUkg1rUkj9MYxXLYueNOFTMkGRNlUx1vc=;
        b=Uy4EWenIBc6TM3TTtVm+C6eg3GdCXCchboY87enpUxmWI9fq//i4geS2fOWbYEAJBg
         qJ1dejZK0+1rIMA1LT2H0CMQgyUVYwBhsDx8Q+QxiMFImopekMkFvdC9Hs0zWxv3w/+M
         N2WZZKKUj3+kHVwdLw5nMMtAq6GaBrQ1seh8NsB4zAxply1D6RqR0Yp74Gx25qMxlGjl
         GiD5s47ClYJC9VuDrmuRHkLbit/t3d7lLWCkok+cCI2BV4MrFTzzXwcH9QpShII608Sc
         4cAwmY3MM1PDooVlgisiwQh/D4lyQJ7akLAss17HbvLMFEfZ3rPikC0SPk+UmLmu+Cfm
         XVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VMQVzT8ljZTUkg1rUkj9MYxXLYueNOFTMkGRNlUx1vc=;
        b=FyVS35lRXfpJRb4ojJLa0P2HZ/wMQhEUOrjlwWrLgIZoxYI4mjLJtouAq+v5m3fx3R
         Ikd5HALZ1cyeuhFFv0+BBfRLzlk0/m/uFsBokMPIvINEWD+MBLwLH5qzH+/6ZlwrsJB5
         1KrD8CYLQsmFR86x2amIn35OfLlcK+lYKc5ZnQRi58KduiWmT+rASpdhkpnVfwjN7xIn
         w24QsYcHADSUEDzPvmJEwqWk9TH3AULyznGNrN/SrmuH1XSph4lLzOsnLBEkoKdsV3T6
         j18LHJtzmJHCWQns+4V4BNuMsILFVoZQ9i1tc68PoZedcNKOPDnlRPsJdbXMRHIMSuRj
         q6zg==
X-Gm-Message-State: AOAM531aj1ykdhrl1rnJtEEQTf3Ffc0ZjF0D9T1F1WQdxP/4GCgqrF6M
	poWUb94stOoETjpEJUT4xbM=
X-Google-Smtp-Source: ABdhPJzd/JAU3tZnnh36560L070cueoskaBJFG5G6lpJltb+MkSpsoEwOctku38OLIg0AV3M6UF9Nw==
X-Received: by 2002:ac8:7ee4:: with SMTP id r4mr7437944qtc.148.1631830070753;
        Thu, 16 Sep 2021 15:07:50 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id q192sm3453766qka.93.2021.09.16.15.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 15:07:50 -0700 (PDT)
Date: Thu, 16 Sep 2021 18:07:48 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: qiang.zhang@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [PATCH] openvswitch: fix CVE-2021-36980
Message-ID: <20210916220745.GA25504@gmail.com>
References: <20210910032104.38901-1-qiang.zhang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20210910032104.38901-1-qiang.zhang@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: [PATCH] openvswitch: fix CVE-2021-36980
on 10/09/2021 qiang.zhang@windriver.com wrote:

> From: Zqiang <qiang.zhang@windriver.com>
> 
> Open vSwitch (aka openvswitch) 2.11.0 through 2.15.0 has
> a use-after-free in decode_NXAST_RAW_ENCAP (called from
> ofpact_decode and ofpacts_decode) during the decoding of
> a RAW_ENCAP action.
> 
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2021-36980
> 
> Patches from:
> https://github.com/openvswitch/ovs/commit/65c61b0c23a0d474696d7b1cea522a5016a8aeb3
> 
> Signed-off-by: Zqiang <qiang.zhang@windriver.com>
> ---
>  ...use-after-free-while-decoding-RAW_EN.patch | 97 +++++++++++++++++++
>  .../openvswitch/openvswitch_git.bb            |  1 +
>  2 files changed, 98 insertions(+)
>  create mode 100644 recipes-networking/openvswitch/files/0001-ofp-actions-Fix-use-after-free-while-decoding-RAW_EN.patch
> 
> diff --git a/recipes-networking/openvswitch/files/0001-ofp-actions-Fix-use-after-free-while-decoding-RAW_EN.patch b/recipes-networking/openvswitch/files/0001-ofp-actions-Fix-use-after-free-while-decoding-RAW_EN.patch
> new file mode 100644
> index 00000000..3afd1bad
> --- /dev/null
> +++ b/recipes-networking/openvswitch/files/0001-ofp-actions-Fix-use-after-free-while-decoding-RAW_EN.patch
> @@ -0,0 +1,97 @@
> +From 77cccc74deede443e8b9102299efc869a52b65b2 Mon Sep 17 00:00:00 2001
> +From: Ilya Maximets <i.maximets@ovn.org>
> +Date: Tue, 16 Feb 2021 23:27:30 +0100
> +Subject: [PATCH] ofp-actions: Fix use-after-free while decoding RAW_ENCAP.
> +
> +While decoding RAW_ENCAP action, decode_ed_prop() might re-allocate
> +ofpbuf if there is no enough space left.  However, function
> +'decode_NXAST_RAW_ENCAP' continues to use old pointer to 'encap'
> +structure leading to write-after-free and incorrect decoding.
> +
> +  ==3549105==ERROR: AddressSanitizer: heap-use-after-free on address
> +  0x60600000011a at pc 0x0000005f6cc6 bp 0x7ffc3a2d4410 sp 0x7ffc3a2d4408
> +  WRITE of size 2 at 0x60600000011a thread T0
> +    #0 0x5f6cc5 in decode_NXAST_RAW_ENCAP lib/ofp-actions.c:4461:20
> +    #1 0x5f0551 in ofpact_decode ./lib/ofp-actions.inc2:4777:16
> +    #2 0x5ed17c in ofpacts_decode lib/ofp-actions.c:7752:21
> +    #3 0x5eba9a in ofpacts_pull_openflow_actions__ lib/ofp-actions.c:7791:13
> +    #4 0x5eb9fc in ofpacts_pull_openflow_actions lib/ofp-actions.c:7835:12
> +    #5 0x64bb8b in ofputil_decode_packet_out lib/ofp-packet.c:1113:17
> +    #6 0x65b6f4 in ofp_print_packet_out lib/ofp-print.c:148:13
> +    #7 0x659e3f in ofp_to_string__ lib/ofp-print.c:1029:16
> +    #8 0x659b24 in ofp_to_string lib/ofp-print.c:1244:21
> +    #9 0x65a28c in ofp_print lib/ofp-print.c:1288:28
> +    #10 0x540d11 in ofctl_ofp_parse utilities/ovs-ofctl.c:2814:9
> +    #11 0x564228 in ovs_cmdl_run_command__ lib/command-line.c:247:17
> +    #12 0x56408a in ovs_cmdl_run_command lib/command-line.c:278:5
> +    #13 0x5391ae in main utilities/ovs-ofctl.c:179:9
> +    #14 0x7f6911ce9081 in __libc_start_main (/lib64/libc.so.6+0x27081)
> +    #15 0x461fed in _start (utilities/ovs-ofctl+0x461fed)
> +
> +Fix that by getting a new pointer before using.
> +
> +Credit to OSS-Fuzz.
> +
> +Fuzzer regression test will fail only with AddressSanitizer enabled.
> +
> +Reported-at: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=27851
> +Fixes: f839892a206a ("OF support and translation of generic encap and decap")
> +Acked-by: William Tu <u9012063@gmail.com>
> +Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
> +---
> + lib/ofp-actions.c                                       | 2 ++
> + tests/automake.mk                                       | 3 ++-
> + tests/fuzz-regression-list.at                           | 1 +
> + tests/fuzz-regression/ofp_print_fuzzer-6540965472632832 | 0
> + 4 files changed, 5 insertions(+), 1 deletion(-)
> + create mode 100644 tests/fuzz-regression/ofp_print_fuzzer-6540965472632832
> +
> +diff --git a/lib/ofp-actions.c b/lib/ofp-actions.c
> +index e2e829772..0342a228b 100644
> +--- a/lib/ofp-actions.c
> ++++ b/lib/ofp-actions.c
> +@@ -4431,6 +4431,7 @@ decode_NXAST_RAW_ENCAP(const struct nx_action_encap *nae,
> + {
> +     struct ofpact_encap *encap;
> +     const struct ofp_ed_prop_header *ofp_prop;
> ++    const size_t encap_ofs = out->size;
> +     size_t props_len;
> +     uint16_t n_props = 0;
> +     int err;
> +@@ -4458,6 +4459,7 @@ decode_NXAST_RAW_ENCAP(const struct nx_action_encap *nae,
> +         }
> +         n_props++;
> +     }
> ++    encap = ofpbuf_at_assert(out, encap_ofs, sizeof *encap);
> +     encap->n_props = n_props;
> +     out->header = &encap->ofpact;
> +     ofpact_finish_ENCAP(out, &encap);
> +diff --git a/tests/automake.mk b/tests/automake.mk
> +index 677b99a6b..fc80e027d 100644
> +--- a/tests/automake.mk
> ++++ b/tests/automake.mk
> +@@ -134,7 +134,8 @@ FUZZ_REGRESSION_TESTS = \
> + 	tests/fuzz-regression/ofp_print_fuzzer-5722747668791296 \
> + 	tests/fuzz-regression/ofp_print_fuzzer-6285128790704128 \
> + 	tests/fuzz-regression/ofp_print_fuzzer-6470117922701312 \
> +-	tests/fuzz-regression/ofp_print_fuzzer-6502620041576448
> ++	tests/fuzz-regression/ofp_print_fuzzer-6502620041576448 \
> ++	tests/fuzz-regression/ofp_print_fuzzer-6540965472632832
> + $(srcdir)/tests/fuzz-regression-list.at: tests/automake.mk
> + 	$(AM_V_GEN)for name in $(FUZZ_REGRESSION_TESTS); do \
> +             basename=`echo $$name | sed 's,^.*/,,'`; \
> +diff --git a/tests/fuzz-regression-list.at b/tests/fuzz-regression-list.at
> +index e3173fb88..2347c690e 100644
> +--- a/tests/fuzz-regression-list.at
> ++++ b/tests/fuzz-regression-list.at
> +@@ -21,3 +21,4 @@ TEST_FUZZ_REGRESSION([ofp_print_fuzzer-5722747668791296])
> + TEST_FUZZ_REGRESSION([ofp_print_fuzzer-6285128790704128])
> + TEST_FUZZ_REGRESSION([ofp_print_fuzzer-6470117922701312])
> + TEST_FUZZ_REGRESSION([ofp_print_fuzzer-6502620041576448])
> ++TEST_FUZZ_REGRESSION([ofp_print_fuzzer-6540965472632832])
> +diff --git a/tests/fuzz-regression/ofp_print_fuzzer-6540965472632832 b/tests/fuzz-regression/ofp_print_fuzzer-6540965472632832
> +new file mode 100644
> +index 000000000..e69de29bb
> +-- 
> +2.17.1
> +
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index 1fa7fb2c..4f5454fe 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -30,6 +30,7 @@ SRC_URI += "git://github.com/openvswitch/ovs.git;protocol=git;branch=branch-2.15
>              file://0001-ovs-use-run-instead-of-var-run-for-in-systemd-units.patch \
>              file://0001-openvswitch-fix-do_configure-with-DPDK-19.11-error.patch \
>              file://0001-openvswitch-fix-netdev-dpdk-compile-error.patch \
> +            file://0001-ofp-actions-Fix-use-after-free-while-decoding-RAW_EN.patch \

You generated this patch against somether other than meta-virtualization
master, since the patches in context of this patch, are not in the recipe.

The patch itself also should have an: Upstream-status: Backport, to help
when we uprev OVS next.

I've sorted out the patch context issue, and added the status. I started
a sanity build of OVS, and have staged this on master-next.

Bruce

>             "
>  
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
> -- 
> 2.17.1
> 
