Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 080F1C433EF
	for <webhook@archiver.kernel.org>; Fri, 17 Jun 2022 14:33:11 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web10.31093.1655476381781540510
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Jun 2022 07:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lzz/5iNX;
 spf=pass (domain: gmail.com, ip: 209.85.217.51,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id r4so4241323vsf.10
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Jun 2022 07:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qb4w1sI67RssZOz6ixFla5b4cy6yTokvMcD546WoPdE=;
        b=lzz/5iNXfKLARezTBA8LXBTvhZT9p6PhMTh4HwXvqxTr7Ob8lAcVWSht3L4wgu+lhH
         S5vZCCwF0IxO3OfAC7Cau3RjQQXyUch/ff/rd4hfaxriX2OuWh96Yc1l0DDhntjA5UIm
         j9bT4E6WWhMGP73NkBQvIQ8R9tVi9K5riNcPJbiDztRCCZyTa8sEEDMP9UOfVnSw7Bt0
         /WjGb4ggtroES7I7kV+H4IhWZi5xmK202s+Mfyioh2cXm2ets+aaLCwg7/8FLasMB4JP
         tUhGHJdnRgCdJUNu6x347SHeeaphDG7uHhlmB1sYUaSfb96Q6UeWbBLMDoog9sRjwzte
         gZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qb4w1sI67RssZOz6ixFla5b4cy6yTokvMcD546WoPdE=;
        b=7aav21SaSy7Qup25vpNflg3wHILWWuP8g4UOT7+4psIT/emlJPQg7fmn43PhyrM673
         4BbN6ZyibHYowrg13Ob5e/ffmRfxWaPoRyvjredahGT7U0Z904OxzpY+05sG73ESy8j/
         OVV61By6nZhljXvd4/pNQdpIymwf9RVBIMPYNg9GLRe3KdBOlmwFrDaR0KvkIaKX6mWV
         ilKoJlS21bV4m1f8TEvNRfqyt4lWtm4FCbvewuwaoVDF5jQK7Ncz4pn5u1XWbNxFPRKe
         QUeCxRsROlxzbqj4ww1sL0nzDkKcmJInk1szHA1YPgyvEltPMQuBdqiG1kxeVmC4NIgR
         TQyg==
X-Gm-Message-State: AJIora+xTNfF8P4m0oRpGo21IABvmLhcifz7wtsFZDZhj0CHObsD684s
	W24tmNoghhyNqWgOl5zwaJ+7ZQx6/nNRzrQB8zc=
X-Google-Smtp-Source: 
 AGRyM1uI4MYnzElM0+3lIjhZ1QFbG8+3D6cXFsJ8qP/wkOz+J+TH1LokS4PLLbmDNdCeguPZHv3JpKrSB/zuS2fL4KA=
X-Received: by 2002:a67:d007:0:b0:34b:9a07:8403 with SMTP id
 r7-20020a67d007000000b0034b9a078403mr4543972vsi.0.1655476380843; Fri, 17 Jun
 2022 07:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220609095748.176486-1-michal.orzel@arm.com>
 <20220609095748.176486-2-michal.orzel@arm.com>
 <52F65039-0525-4B22-B8D9-7B59B49B02E6@arm.com>
In-Reply-To: <52F65039-0525-4B22-B8D9-7B59B49B02E6@arm.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Fri, 17 Jun 2022 07:32:50 -0700
Message-ID: 
 <CACMJ4GbrTkPxiMusy3v365ii4UBOfb=XJE6-rCvem5PCjXZONw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 1/2] Revert "xen: Disable PCI on
 qemuarm with Xen"
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Michal Orzel <Michal.Orzel@arm.com>,
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>,
	"meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Jun 2022 14:33:11 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7387

On Thu, Jun 9, 2022 at 3:01 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Michal,
>
> > On 9 Jun 2022, at 10:57, Michal Orzel via lists.yoctoproject.org <michal.orzel=arm.com@lists.yoctoproject.org> wrote:
> >
> > This reverts commit fb0a7b97db4f419b82309f98a4944ae3330d1e2e.
> >
> > Justification:
> > Commit fb0a7b97db4f removed the PCI node from the qemu device tree
> > due to the issue when trying to access PCI configuration space that
> > was causing Linux running on top of Xen to end up in an infinite loop.
> > The investigation showed that the problem occurs due to qemu placing
> > ECAM space at 256GiB mark. Even though Xen officially supports on arm32
> > up to 12GiB of physical address space, it is able to map it correctly
> > for dom0. However, when Linux tries to access the ECAM space and the
> > stage2 translation fault occurs, HPFAR register contains incorrect IPA.
> > We can say it is incorrect because using hardware AT instruction or
> > software lookup, we can obtain the correct IPA from the same VA. This
> > can suggest that the problem is related to QEMU fault handling.
> >
> > Instead of removing the PCI node the follow-up commit will disable
> > highmem option in qemu which will cause placing ECAM space in the
> > 32-bit space.
> >
> > Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>

>
> Also tested on kirkstone and dom0 boots fine and pci is working.

Thanks for this

Christopher

>
> Thanks a lot
> Cheers
> Bertrand
>
> > ---
> > classes/qemuboot-xen-dtb.bbclass | 22 ----------------------
> > 1 file changed, 22 deletions(-)
> >
> > diff --git a/classes/qemuboot-xen-dtb.bbclass b/classes/qemuboot-xen-dtb.bbclass
> > index 1f17a86..d43d23a 100644
> > --- a/classes/qemuboot-xen-dtb.bbclass
> > +++ b/classes/qemuboot-xen-dtb.bbclass
> > @@ -63,21 +63,6 @@ write_lops_xen_section() {
> > EOF
> > }
> >
> > -write_lop_rm_pci() {
> > -    cat <<EOF >"$1"
> > -/dts-v1/;
> > -/ {
> > -    compatible = "system-device-tree-v1";
> > -    lops {
> > -        lop_1 {
> > -            compatible = "system-device-tree-v1,lop,modify";
> > -            modify = "/pcie@10000000::";
> > -        };
> > -     };
> > -};
> > -EOF
> > -}
> > -
> > write_lop_add_to_xen_cmdline() {
> >     EXTRA_XEN_BOOTARGS="$2"
> >     cat <<EOF >"$1"
> > @@ -150,13 +135,6 @@ generate_xen_qemuboot_dtb() {
> >     write_lop_add_to_xen_cmdline "${B}/lop-xen-cmdline.dts" \
> >         "${QB_XEN_CMDLINE_EXTRA}"
> >
> > -    # On Qemu Arm32, Dom0 accessing PCI config space ends up in an
> > -    # infinite loop. Remove pci node from the device tree
> > -    if [ "${MACHINE}" = "qemuarm" ]; then
> > -        write_lop_rm_pci "${B}/lop-rm-pci.dts"
> > -        LOP_MODULE_ARGS="${LOP_MODULE_ARGS} -i ${B}/lop-rm-pci.dts"
> > -    fi
> > -
> >     if [ -z "${QB_XEN_DOMAIN_MODULES}" ]; then
> >         bbwarn "No domain modules: please set QB_XEN_DOMAIN_MODULES"
> >     fi
> > --
> > 2.25.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7351): https://lists.yoctoproject.org/g/meta-virtualization/message/7351
> > Mute This Topic: https://lists.yoctoproject.org/mt/91642063/3619089
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bertrand.marquis@arm.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

