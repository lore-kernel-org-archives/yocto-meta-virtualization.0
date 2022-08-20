Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFDBEC28D13
	for <webhook@archiver.kernel.org>; Sat, 20 Aug 2022 01:06:03 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web08.2526.1660957560786342652
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 19 Aug 2022 18:06:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JKPiX9r3;
 spf=pass (domain: gmail.com, ip: 209.85.160.53,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-11cc7698a18so3974202fac.4
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 19 Aug 2022 18:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=DiqN9UOhQPyQPwocjBBuC+Pr5Bo00c+eVJr6TFjIZXc=;
        b=JKPiX9r3dcK5n8+RvOHvcKPoXe8pfEqezuXmo5P0pEGp/a57KOLT9dotD7ycDGQhSI
         SFKSatkp5/esRbtSRoYy5A1Pd5+lzE4U0PSu1hyBbofgN4yUtUs8olcaQ+GDwrFo4e9c
         ZkLjt+pCMBiAfupxaMB47TQcz6fLqgupTPNPzvJolNDXtMnsrq8x2Spynx2oju8FZ1ah
         5AkSZKc530TFfb9jp+drymQRKU98eUDKU2pmHOJb6FClYuJM7aTbsIlRZl1bdD7uUAqL
         YYOVBrlRndb5RJIVRWMXK/9pK+0JofBpAEa2Z85ewBX+FDgoeDR/BhQSdwdVrn+3XCgh
         jSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=DiqN9UOhQPyQPwocjBBuC+Pr5Bo00c+eVJr6TFjIZXc=;
        b=MzqvxB9ktQaUclUdl0qQoV+P0gLV6ug/FUe/F+El5/0+ggGR3lm2zR3HQqyVmVu8Qm
         D7gEN19ZRYoDX7IiJYc4qUmX1QPj7JABt7hLSRLu+6eHtSF1KM362GbTzlb9T7MlDphS
         OwW2PrVT3eK7/BtDNcPQxQU0smwpWC1P4rZPxbOPlZMYJiZDTEA30bGV2OmGeA1wLwoi
         RNRNAOBfrnsLNZW+FxBYHUz8NbHAb8fTHeSON6KEokiyjb7u4KsOSb5ss5hBYgZ2xMf3
         BG6erS2shLxj7LvdvLRPwpY+gbqS6cIbrvt+WJN95Bsxd1SW2d0U+OArCfh6aQKTwBTb
         bA4Q==
X-Gm-Message-State: ACgBeo02hSZxskDAmMG2iCkDIZchV9ECNndEXrggICAXrJp+hzBbDZr9
	em0zZDvvSkDqnwkI+LmM/nt62UbTA/m3qcuShWrWr1jl
X-Google-Smtp-Source: 
 AA6agR7wDklgRVExjXVR0lEj2Kbgx3rByNX7DA0pmP2+Q1b3tmbFNzIkUCNjRZ07+H8HPg67HXZEMvJ9awlg5pSL0Dw=
X-Received: by 2002:a05:6870:d29d:b0:10e:747b:f87b with SMTP id
 d29-20020a056870d29d00b0010e747bf87bmr7851631oae.6.1660957560059; Fri, 19 Aug
 2022 18:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220815210243.25546-1-sakib.sajal@windriver.com>
 <CADkTA4MX053i=kVX2xDjKVNS-6tELBoopEYLABxFPazzyTULdA@mail.gmail.com>
 <BY5PR11MB39922BCF8D81159B0F0179E5886A9@BY5PR11MB3992.namprd11.prod.outlook.com>
 <CADkTA4Mrst2j8A5RJNYiV_QhrFQY7X-wdjsNXqFBHboR4GXfKg@mail.gmail.com>
 <a4e9265c-0a69-b5c8-6304-876a05c52bb1@windriver.com>
In-Reply-To: <a4e9265c-0a69-b5c8-6304-876a05c52bb1@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 19 Aug 2022 21:05:48 -0400
Message-ID: 
 <CADkTA4N_Kmf0a1S=TmN5t87oyyX6N7qt5jgjeRa46EnwO3+apA@mail.gmail.com>
Subject: Re: [kirkstone][meta-virtualization][PATCH] ceph: upgrade v15.2.15 ->
 v15.2.17
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: "Slater, Joseph" <joe.slater@windriver.com>,
	"meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 20 Aug 2022 01:06:03 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7547

On Fri, Aug 19, 2022 at 6:48 PM Sakib Sajal <sakib.sajal@windriver.com> wrote:
>
>
> On 2022-08-17 12:29, Bruce Ashfield wrote:
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> > Thanks Joe!
> >
> > Bruce
> On the same note,
>
> ceph on master branch is also affected by the CVE's mentioned in this
> thread.
>
> Versions of ceph that contain the fix: v15.2.17, v16.2.10, v17.2.2, v17.2.3
>
> I could send and upgrade to the v15.2.17 release like I did for
> kirkstone, however upgrading to more recent releases is more logical.
>

I was going to suggest the same thing, an uprev is a good idea for master.

> Is an upgrade for ceph on master under work? If not, I can volunteer.

I haven't started one yet, so feel free!

Bruce

>
> Sakib
>
> >
> > On Wed, Aug 17, 2022 at 12:28 PM Slater, Joseph
> > <joe.slater@windriver.com> wrote:
> >> The CVE fix I sent you is in the upgraded version of ceph.     Joe
> >>
> >>> -----Original Message-----
> >>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >>> Sent: Wednesday, August 17, 2022 7:19 AM
> >>> To: Sajal, Sakib <Sakib.Sajal@windriver.com>; Slater, Joseph
> >>> <joe.slater@windriver.com>
> >>> Cc: meta-virtualization@lists.yoctoproject.org
> >>> Subject: Re: [kirkstone][meta-virtualization][PATCH] ceph: upgrade v15.2.15 ->
> >>> v15.2.17
> >>>
> >>> I also have a pending patch from Joe Slater that addresses a different CVE on
> >>> kirkstone.
> >>>
> >>> Can someone look and check if it is also covered by this uprev ? Ceph takes an
> >>> incredibly long time to build on my servers, so I'd like to avoid as many builds as
> >>> possible.
> >>>
> >>> Bruce
> >>>
> >>>
> >>> On Mon, Aug 15, 2022 at 5:03 PM <sakib.sajal@windriver.com> wrote:
> >>>> Upgrade ceph to latest v15.x.
> >>>> Minor upgrade containing fix for CVE-2022-0670.
> >>>>
> >>>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> >>>> ---
> >>>>   recipes-extended/ceph/{ceph_15.2.15.bb => ceph_15.2.17.bb} | 2 +-
> >>>>   1 file changed, 1 insertion(+), 1 deletion(-)  rename
> >>>> recipes-extended/ceph/{ceph_15.2.15.bb => ceph_15.2.17.bb} (98%)
> >>>>
> >>>> diff --git a/recipes-extended/ceph/ceph_15.2.15.bb
> >>>> b/recipes-extended/ceph/ceph_15.2.17.bb
> >>>> similarity index 98%
> >>>> rename from recipes-extended/ceph/ceph_15.2.15.bb
> >>>> rename to recipes-extended/ceph/ceph_15.2.17.bb
> >>>> index 17dbcf3..9fb2e72 100644
> >>>> --- a/recipes-extended/ceph/ceph_15.2.15.bb
> >>>> +++ b/recipes-extended/ceph/ceph_15.2.17.bb
> >>>> @@ -16,7 +16,7 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-
> >>> ${PV}.tar.gz \
> >>>> file://0001-SnappyCompressor.h-fix-snappy-compiler-error.patch \  "
> >>>>
> >>>> -SRC_URI[sha256sum] =
> >>> "5dccdaff2ebe18d435b32bfc06f8b5f474bf6ac0432a6a07d144b7c56700d0bf"
> >>>> +SRC_URI[sha256sum] =
> >>> "d8efe4996aeb01dd2f1cc939c5e434e5a7e2aeaf3f659c0510ffd550477a32e2"
> >>>>   DEPENDS = "boost bzip2 curl expat gperf-native \
> >>>>              keyutils libaio libibverbs lz4 \
> >>>> --
> >>>> 2.33.0
> >>>>
> >>>>
> >>>> -=-=-=-=-=-=-=-=-=-=-=-
> >>>> Links: You receive all messages sent to this group.
> >>>> View/Reply Online (#7523):
> >>>> https://lists.yoctoproject.org/g/meta-virtualization/message/7523
> >>>> Mute This Topic: https://lists.yoctoproject.org/mt/93046468/1050810
> >>>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> >>>> Unsubscribe:
> >>>> https://lists.yoctoproject.org/g/meta-virtualization/unsub
> >>>> [bruce.ashfield@gmail.com]
> >>>> -=-=-=-=-=-=-=-=-=-=-=-
> >>>>
> >>>
> >>> --
> >>> - Thou shalt not follow the NULL pointer, for chaos and madness await thee at
> >>> its end
> >>> - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

