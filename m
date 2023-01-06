Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A24C3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 15:42:33 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web10.16794.1673019748629971777
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Jan 2023 07:42:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OmEMliNW;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id u8so1127855ilq.13
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Jan 2023 07:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NKdY6xyvbu6MHFkq83feeWK/9APwL7buy23kA09ILtQ=;
        b=OmEMliNWVDDetCoMbdRLlS3QNKfYQGC7kdeWxKb4UaI1bSbjnJqnXqQCiY/VrXwcZb
         3FWFbxVKE/NCfVeuf9hcbTocqTL77Nz8KkQdtiSVU3cu5vPi0Jmv8tO/NN8AXq+2hBJt
         DFJ4DnjRr16JeX837gn8pRU6MY/ajtYMGt2v9eF+yvLEhP78dlX131vbVwDJJwjzrJtY
         ct8O0WjoQYSImfGNELJ96a1T5IrwBktivvmDq9j3nRL6kbJOfEeW14S07f0FYuvK1HDv
         h9CMNw8wBQJW2443543uiERoC5blu/UmPbQwaklYUnITNzRQtb3YRmKzzpW3+QfElBvR
         Cysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NKdY6xyvbu6MHFkq83feeWK/9APwL7buy23kA09ILtQ=;
        b=f8TDOEVuzm9XQh0jRJ3RtnT7K/V+VmBIrtqWWJSREQCnNJno+DszKp5gEFSJMzhNCq
         HDDfQh09wE5keKIEpY2svHVpvS1cJRksmAzOfBpxELE7EYgIFMwe8eJ40UPAe2soMOqQ
         9TVfP7iU5M6QTFbpkw7CrOqgplqW0dMPiwicyGP8A2x14dPzqW4bLmnHgDUW7fgfMcJ8
         QyHwKb0/QwVjGYhASZksMDxTqAng8Z6gVV1H5rb3nh5lSCqGTWK3h9vZkQpkbUPVR09d
         o3GfbLV9lLxmPav/TRHT7b3NNMF/yLLvjrnqpwAhw+XHJfyDKZr0MIZxDQe3OQC7Ejxd
         a28g==
X-Gm-Message-State: AFqh2kr68r/YSQDdDweGlyvD0y5s6cT/dvMEVrJ0IdJRbP9QhK7LuhWe
	e56Cy7BlIRrcIcMvh0vlmO2fJWeTjcOLoL23ApWc72zN
X-Google-Smtp-Source: AMrXdXuiTh3HfJM18tq4tqVtCdv2kknS0KI+D5L5110HoWPsI70/KwLH8SWiinHA88qNjLwEEoaCTa4eRPJVEs7JIG0=
X-Received: by 2002:a92:cda1:0:b0:30c:21d5:5ce0 with SMTP id
 g1-20020a92cda1000000b0030c21d55ce0mr3781191ild.28.1673019747954; Fri, 06 Jan
 2023 07:42:27 -0800 (PST)
MIME-Version: 1.0
References: <1734D8DBF4A40DBC.27785@lists.yoctoproject.org> <cd8582e2-5a67-d753-6ea1-5c181569f731@windriver.com>
In-Reply-To: <cd8582e2-5a67-d753-6ea1-5c181569f731@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 6 Jan 2023 10:42:16 -0500
Message-ID: <CADkTA4NgW4Y_RPO+2yObKEtpt1UWYtPwsp0-VFomSgGa1uWTWA@mail.gmail.com>
Subject: Re: [meta-virtualization][master][langdale][kirkstone][PATCH]
 openvswitch: backport patch to fix CVE-2022-4337 and CVE-2022-4338
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Jan 2023 15:42:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7802

On Thu, Jan 5, 2023 at 11:09 PM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
>
> On 12/28/22 11:56, Xiangyu Chen wrote:
> > From: Xiangyu Chen <xiangyu.chen@windriver.com>
> >
> > CVE-2022-4337: openvswitch: Out-of-Bounds Read in Organization Specific TLV
> > CVE-2022-4338: openvswitch: Integer Underflow in Organization Specific TLV
> >
> > Reference:
> > https://github.com/openvswitch/ovs/pull/405
> > https://github.com/openvswitch/ovs/commit/7490f281f09a8455c48e19b0cf1b99ab758ee4f4
> >
> > Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> Friendly ping, thanks ;)

I've been on holidays, and won't be doing any merges until the start
of next week.

I only did a few very critical merges to keep the layer compatible
with OE core master.

So this has been noted and is in the queue.

Bruce

>
> Br,
>
> Xiangyu
>
>
> > ---
> >   ...gs-when-parsing-malformed-AutoAttach.patch | 86 +++++++++++++++++++
> >   .../openvswitch/openvswitch_git.bb            |  1 +
> >   2 files changed, 87 insertions(+)
> >   create mode 100644 recipes-networking/openvswitch/files/0001-lldp-Fix-bugs-when-parsing-malformed-AutoAttach.patch
> >
> > diff --git a/recipes-networking/openvswitch/files/0001-lldp-Fix-bugs-when-parsing-malformed-AutoAttach.patch b/recipes-networking/openvswitch/files/0001-lldp-Fix-bugs-when-parsing-malformed-AutoAttach.patch
> > new file mode 100644
> > index 0000000..ec40106
> > --- /dev/null
> > +++ b/recipes-networking/openvswitch/files/0001-lldp-Fix-bugs-when-parsing-malformed-AutoAttach.patch
> > @@ -0,0 +1,86 @@
> > +From 7490f281f09a8455c48e19b0cf1b99ab758ee4f4 Mon Sep 17 00:00:00 2001
> > +From: Qian Chen <cq674350529@163.com>
> > +Date: Tue, 20 Dec 2022 09:36:08 -0500
> > +Subject: [PATCH] lldp: Fix bugs when parsing malformed AutoAttach.
> > +
> > +The OVS LLDP implementation includes support for AutoAttach standard, which
> > +the 'upstream' lldpd project does not include.  As part of adding this
> > +support, the message parsing for these TLVs did not include proper length
> > +checks for the LLDP_TLV_AA_ELEMENT_SUBTYPE and the
> > +LLDP_TLV_AA_ISID_VLAN_ASGNS_SUBTYPE elements.  The result is that a message
> > +without a proper boundary will cause an overread of memory, and lead to
> > +undefined results, including crashes or other unidentified behavior.
> > +
> > +The fix is to introduce proper bounds checking for these elements.  Introduce
> > +a unit test to ensure that we have some proper rejection in this code
> > +base in the future.
> > +
> > +Fixes: be53a5c447c3 ("auto-attach: Initial support for Auto-Attach standard")
> > +
> > +Upstream-Status: Backport from upstream [https://github.com/openvswitch/ovs/commit/7490f281f09a8455c48e19b0cf1b99ab758ee4f4]
> > +CVE: CVE-2022-4337 - openvswitch: Out-of-Bounds Read in Organization Specific TLV
> > +CVE: CVE-2022-4338 - openvswitch: Integer Underflow in Organization Specific TLV
> > +
> > +Signed-off-by: Qian Chen <cq674350529@163.com>
> > +Co-authored-by: Aaron Conole <aconole@redhat.com>
> > +Signed-off-by: Aaron Conole <aconole@redhat.com>
> > +Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
> > +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> > +---
> > + lib/lldp/lldp.c       |  2 ++
> > + tests/ofproto-dpif.at | 19 +++++++++++++++++++
> > + 2 files changed, 21 insertions(+)
> > +
> > +diff --git a/lib/lldp/lldp.c b/lib/lldp/lldp.c
> > +index dfeb2a800..6fdcfef56 100644
> > +--- a/lib/lldp/lldp.c
> > ++++ b/lib/lldp/lldp.c
> > +@@ -583,6 +583,7 @@ lldp_decode(struct lldpd *cfg OVS_UNUSED, char *frame, int s,
> > +
> > +                 switch(tlv_subtype) {
> > +                 case LLDP_TLV_AA_ELEMENT_SUBTYPE:
> > ++                    CHECK_TLV_SIZE(50, "ELEMENT");
> > +                     PEEK_BYTES(&msg_auth_digest, sizeof msg_auth_digest);
> > +
> > +                     aa_element_dword = PEEK_UINT32;
> > +@@ -629,6 +630,7 @@ lldp_decode(struct lldpd *cfg OVS_UNUSED, char *frame, int s,
> > +                     break;
> > +
> > +                 case LLDP_TLV_AA_ISID_VLAN_ASGNS_SUBTYPE:
> > ++                    CHECK_TLV_SIZE(36, "ISID_VLAN_ASGNS");
> > +                     PEEK_BYTES(&msg_auth_digest, sizeof msg_auth_digest);
> > +
> > +                     /* Subtract off tlv type and length (2Bytes) + OUI (3B) +
> > +diff --git a/tests/ofproto-dpif.at b/tests/ofproto-dpif.at
> > +index eb4cd1896..fa6111c1e 100644
> > +--- a/tests/ofproto-dpif.at
> > ++++ b/tests/ofproto-dpif.at
> > +@@ -62,6 +62,25 @@ AT_CHECK([ovs-appctl coverage/read-counter rev_reconfigure], [0], [dnl
> > + OVS_VSWITCHD_STOP
> > + AT_CLEANUP
> > +
> > ++AT_SETUP([ofproto-dpif - malformed lldp autoattach tlv])
> > ++OVS_VSWITCHD_START()
> > ++add_of_ports br0 1
> > ++
> > ++dnl Enable lldp
> > ++AT_CHECK([ovs-vsctl set interface p1 lldp:enable=true])
> > ++
> > ++dnl Send a malformed lldp packet
> > ++packet="0180c200000ef6b426aa5f0088cc020704f6b426aa5f000403057632060200780c"dnl
> > ++"5044454144424545464445414442454546444541444245454644454144424545464445414"dnl
> > ++"4424545464445414442454546444541444245454644454144424545464445414442454546"dnl
> > ++"4445414442454546fe0500040d0c010000"
> > ++AT_CHECK([ovs-appctl netdev-dummy/receive p1 "$packet"], [0], [stdout])
> > ++
> > ++OVS_WAIT_UNTIL([grep -q "ISID_VLAN_ASGNS TLV too short" ovs-vswitchd.log])
> > ++
> > ++OVS_VSWITCHD_STOP(["/|WARN|ISID_VLAN_ASGNS TLV too short received on/d"])
> > ++AT_CLEANUP
> > ++
> > + AT_SETUP([ofproto-dpif - active-backup bonding (with primary)])
> > +
> > + dnl Create br0 with members p1, p2 and p7, creating bond0 with p1 and
> > +--
> > +2.34.1
> > +
> > diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> > index f5d85f3..4f4efe7 100644
> > --- a/recipes-networking/openvswitch/openvswitch_git.bb
> > +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> > @@ -27,6 +27,7 @@ SRC_URI += "git://github.com/openvswitch/ovs.git;protocol=https;branch=branch-2.
> >               file://kernel_module.patch \
> >               file://systemd-update-tool-paths.patch \
> >               file://systemd-create-runtime-dirs.patch \
> > +            file://0001-lldp-Fix-bugs-when-parsing-malformed-AutoAttach.patch \
> >              "
> >
> >   LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7793): https://lists.yoctoproject.org/g/meta-virtualization/message/7793
> Mute This Topic: https://lists.yoctoproject.org/mt/95915106/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

