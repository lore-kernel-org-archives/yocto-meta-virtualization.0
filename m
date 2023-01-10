Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65ED6C54EBC
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 20:16:35 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web10.4245.1673381786478121272
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Jan 2023 12:16:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E63rBey5;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id e129so6700807iof.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Jan 2023 12:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zfwU8+3cZH3ybSubaB2OBI+ArEtmMuYWHK6geq/+s+c=;
        b=E63rBey5RFoQRvjHtbgpqslCDJdRTdOx5vmFH0+sl8RhfePRtA9gharU/7BFRG/MP4
         qKZWAWkUkR4mvdj9g2ycU+AwbtMW+jRWNEE7dt4t+Sy/F9cqgAWC33+HsdMLtAewD8QP
         5AAMLhHPTPUkthLAW57gQptVUut8obJPsMmar+iWqQ2nSSXq0AVC60Kp1GC8hWbl7kQB
         204B2+gdIGoVkcGc8o9sJH1HsgmNPAbxLLD8wBE3wSWhVLmB590XFJ/y4o1XcxZU/lWQ
         z1uXAb/OjrETuv3FCC9f8yo5p6CJaE5+XjvOwaRMbuCVaWTsPAxacmGxpYyqJQZ2M23Z
         OKIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zfwU8+3cZH3ybSubaB2OBI+ArEtmMuYWHK6geq/+s+c=;
        b=rmNmRXeOxWCMVSMevarHpStaBrru/JZyuUwkPh5WNtzlNjqW3NTHD+w1sT5ITb+D0t
         DKrVJGcWMIrVNaRT1LgMDjQrDb5ykqXP0uARTq+ppL1Bmhu5ZBYQxpvFtu24GNPLnClb
         tiKaTAvaaT5fF3KLiWbQOEvg779rTPMGm/4jfVDJuIrEWIbATplib4xTMf3QA4PT318N
         rBSU4CFEyiP+NWPkNLliK2bbWkVwKkN5VkToZ4L3aPVTwBxVkQbSIhbOVXmHEck2JO61
         sS/Go4QZsnPO2xQ/VSdxEaQc1Kjia7+yIpI++Qwj9Vty/xRs2uiq5bxrUszldL/CgGT+
         FIRQ==
X-Gm-Message-State: AFqh2kp/wOdBB9ckTTf98OX1ydj9JIJx3t5zheMJz/mf5rExmiTNbDl3
	MJ49f0viMmHxexYX1adFDnU+U1H5X//NhKvU2Xh9FhxRPg4=
X-Google-Smtp-Source: AMrXdXt9paCp1Hqm6tcyUytVM08vVe4flV/SOlKNlczFbMVE3TaPpVNcbcDatbZ3Sekx8rzPmRHRDwpYh/PK/9EWWfI=
X-Received: by 2002:a6b:b48b:0:b0:704:5e71:ec0d with SMTP id
 d133-20020a6bb48b000000b007045e71ec0dmr237904iof.160.1673381785607; Tue, 10
 Jan 2023 12:16:25 -0800 (PST)
MIME-Version: 1.0
References: <20221228035620.257925-1-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20221228035620.257925-1-xiangyu.chen@eng.windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 Jan 2023 15:16:14 -0500
Message-ID: <CADkTA4NrWLP+nUCYXzdTHqKq8b7yfKetgABFNsXTvAcwU-1i0w@mail.gmail.com>
Subject: Re: [meta-virtualization][master][langdale][kirkstone][PATCH]
 openvswitch: backport patch to fix CVE-2022-4337 and CVE-2022-4338
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Jan 2023 20:16:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7813

I've pushed this to the stable branches, but I have an uprev of OVS on
master-next, so it doesn't look like this is needed there.

Bruce

On Tue, Dec 27, 2022 at 10:56 PM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> CVE-2022-4337: openvswitch: Out-of-Bounds Read in Organization Specific TLV
> CVE-2022-4338: openvswitch: Integer Underflow in Organization Specific TLV
>
> Reference:
> https://github.com/openvswitch/ovs/pull/405
> https://github.com/openvswitch/ovs/commit/7490f281f09a8455c48e19b0cf1b99ab758ee4f4
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  ...gs-when-parsing-malformed-AutoAttach.patch | 86 +++++++++++++++++++
>  .../openvswitch/openvswitch_git.bb            |  1 +
>  2 files changed, 87 insertions(+)
>  create mode 100644 recipes-networking/openvswitch/files/0001-lldp-Fix-bugs-when-parsing-malformed-AutoAttach.patch
>
> diff --git a/recipes-networking/openvswitch/files/0001-lldp-Fix-bugs-when-parsing-malformed-AutoAttach.patch b/recipes-networking/openvswitch/files/0001-lldp-Fix-bugs-when-parsing-malformed-AutoAttach.patch
> new file mode 100644
> index 0000000..ec40106
> --- /dev/null
> +++ b/recipes-networking/openvswitch/files/0001-lldp-Fix-bugs-when-parsing-malformed-AutoAttach.patch
> @@ -0,0 +1,86 @@
> +From 7490f281f09a8455c48e19b0cf1b99ab758ee4f4 Mon Sep 17 00:00:00 2001
> +From: Qian Chen <cq674350529@163.com>
> +Date: Tue, 20 Dec 2022 09:36:08 -0500
> +Subject: [PATCH] lldp: Fix bugs when parsing malformed AutoAttach.
> +
> +The OVS LLDP implementation includes support for AutoAttach standard, which
> +the 'upstream' lldpd project does not include.  As part of adding this
> +support, the message parsing for these TLVs did not include proper length
> +checks for the LLDP_TLV_AA_ELEMENT_SUBTYPE and the
> +LLDP_TLV_AA_ISID_VLAN_ASGNS_SUBTYPE elements.  The result is that a message
> +without a proper boundary will cause an overread of memory, and lead to
> +undefined results, including crashes or other unidentified behavior.
> +
> +The fix is to introduce proper bounds checking for these elements.  Introduce
> +a unit test to ensure that we have some proper rejection in this code
> +base in the future.
> +
> +Fixes: be53a5c447c3 ("auto-attach: Initial support for Auto-Attach standard")
> +
> +Upstream-Status: Backport from upstream [https://github.com/openvswitch/ovs/commit/7490f281f09a8455c48e19b0cf1b99ab758ee4f4]
> +CVE: CVE-2022-4337 - openvswitch: Out-of-Bounds Read in Organization Specific TLV
> +CVE: CVE-2022-4338 - openvswitch: Integer Underflow in Organization Specific TLV
> +
> +Signed-off-by: Qian Chen <cq674350529@163.com>
> +Co-authored-by: Aaron Conole <aconole@redhat.com>
> +Signed-off-by: Aaron Conole <aconole@redhat.com>
> +Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
> +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> +---
> + lib/lldp/lldp.c       |  2 ++
> + tests/ofproto-dpif.at | 19 +++++++++++++++++++
> + 2 files changed, 21 insertions(+)
> +
> +diff --git a/lib/lldp/lldp.c b/lib/lldp/lldp.c
> +index dfeb2a800..6fdcfef56 100644
> +--- a/lib/lldp/lldp.c
> ++++ b/lib/lldp/lldp.c
> +@@ -583,6 +583,7 @@ lldp_decode(struct lldpd *cfg OVS_UNUSED, char *frame, int s,
> +
> +                 switch(tlv_subtype) {
> +                 case LLDP_TLV_AA_ELEMENT_SUBTYPE:
> ++                    CHECK_TLV_SIZE(50, "ELEMENT");
> +                     PEEK_BYTES(&msg_auth_digest, sizeof msg_auth_digest);
> +
> +                     aa_element_dword = PEEK_UINT32;
> +@@ -629,6 +630,7 @@ lldp_decode(struct lldpd *cfg OVS_UNUSED, char *frame, int s,
> +                     break;
> +
> +                 case LLDP_TLV_AA_ISID_VLAN_ASGNS_SUBTYPE:
> ++                    CHECK_TLV_SIZE(36, "ISID_VLAN_ASGNS");
> +                     PEEK_BYTES(&msg_auth_digest, sizeof msg_auth_digest);
> +
> +                     /* Subtract off tlv type and length (2Bytes) + OUI (3B) +
> +diff --git a/tests/ofproto-dpif.at b/tests/ofproto-dpif.at
> +index eb4cd1896..fa6111c1e 100644
> +--- a/tests/ofproto-dpif.at
> ++++ b/tests/ofproto-dpif.at
> +@@ -62,6 +62,25 @@ AT_CHECK([ovs-appctl coverage/read-counter rev_reconfigure], [0], [dnl
> + OVS_VSWITCHD_STOP
> + AT_CLEANUP
> +
> ++AT_SETUP([ofproto-dpif - malformed lldp autoattach tlv])
> ++OVS_VSWITCHD_START()
> ++add_of_ports br0 1
> ++
> ++dnl Enable lldp
> ++AT_CHECK([ovs-vsctl set interface p1 lldp:enable=true])
> ++
> ++dnl Send a malformed lldp packet
> ++packet="0180c200000ef6b426aa5f0088cc020704f6b426aa5f000403057632060200780c"dnl
> ++"5044454144424545464445414442454546444541444245454644454144424545464445414"dnl
> ++"4424545464445414442454546444541444245454644454144424545464445414442454546"dnl
> ++"4445414442454546fe0500040d0c010000"
> ++AT_CHECK([ovs-appctl netdev-dummy/receive p1 "$packet"], [0], [stdout])
> ++
> ++OVS_WAIT_UNTIL([grep -q "ISID_VLAN_ASGNS TLV too short" ovs-vswitchd.log])
> ++
> ++OVS_VSWITCHD_STOP(["/|WARN|ISID_VLAN_ASGNS TLV too short received on/d"])
> ++AT_CLEANUP
> ++
> + AT_SETUP([ofproto-dpif - active-backup bonding (with primary)])
> +
> + dnl Create br0 with members p1, p2 and p7, creating bond0 with p1 and
> +--
> +2.34.1
> +
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index f5d85f3..4f4efe7 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -27,6 +27,7 @@ SRC_URI += "git://github.com/openvswitch/ovs.git;protocol=https;branch=branch-2.
>              file://kernel_module.patch \
>              file://systemd-update-tool-paths.patch \
>              file://systemd-create-runtime-dirs.patch \
> +            file://0001-lldp-Fix-bugs-when-parsing-malformed-AutoAttach.patch \
>             "
>
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
> --
> 2.34.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

