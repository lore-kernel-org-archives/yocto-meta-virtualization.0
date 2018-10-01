Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EBFF4E00B58; Sun, 30 Sep 2018 18:32:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.167.49 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
	[209.85.167.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B8CCBE00901
	for <meta-virtualization@yoctoproject.org>;
	Sun, 30 Sep 2018 18:32:25 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id p34-v6so1281541lfg.10
	for <meta-virtualization@yoctoproject.org>;
	Sun, 30 Sep 2018 18:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=j9GSHh6PA9B1Q+iJ5dDrAu8d6wqWB+kMo3a0av8cp74=;
	b=MxlMXRdAOWCV5fIOwlpknxCMdQuSjbhbRtNhx2EX/a92WX6zI1Djf1l+DRkHNQA9WQ
	fl1ndav+3WJx3ihxaHd0MfEmjgqX7GUORPCQkcbqEVCV3fvyvHO3WPqkw2um9oEflZSL
	POqtAFoGe4Kw9p6thDjniG+H9HaMQGBdvWr+eUf9cm0siMKARajTLtkle8iWySCEcRC6
	Bf26LPCHyRKTXl/Z38ntXbiKwI1ZbXTfvRmIIvmXqvBULfswGlt7TdWxAspUQu2UJguI
	7lxR6BdczocRV82+WUOQZLj/RBpLXqYtAj/c6VYKeMKbdWli5LDj9kNpJ9ix8dAFeFx/
	TuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=j9GSHh6PA9B1Q+iJ5dDrAu8d6wqWB+kMo3a0av8cp74=;
	b=UfKthHPVDyVJHCWxXyNztiaedEF4jWhiPMnYPeeYV8m9tLuQNKaWZ5vgVbCewnB79T
	vgkjl4PcF6QiZQovBMlkVuNn4bfEXTHiPlelpJkr1RaOgvLxvabewuJMveEJ2cpndIpI
	HA8PsLYNkqgsm0yJkEG+pDFgqFjOV9fua/YVTZR0ek3bhJNYj3JsOPVYOrEfVymPPSWb
	QCXgXZvtRyKzHV4910BLDRpnXHrcF0KdgDLYg9L2C/sTrsE+E2FuZyFB7DVzVo1k7uk8
	9VWLlqxIK6gXxkr7jEwIijXN1DwpH/iKY2wGjIdhzbW7ItrpURIYgAZAqKm1xPP/g5QA
	x/sg==
X-Gm-Message-State: ABuFfogMk/RW/GCFsTlz+xAOv9cLZla7QtOOBBA2bFIsmLZuxP1PzuDC
	uv6paiv+EZP4CGfJars3l7eKEt2n1mgtGdAwhsRN0Q==
X-Google-Smtp-Source: ACcGV62DQFEht2BE2QNcbWzikDPK9beOp5tgy4AuMRsvlpFy5hkkxhNsDzymU4TQs9gYAerjthZ1WgrS9PzVBJ4HOiY=
X-Received: by 2002:a19:c20e:: with SMTP id
	l14-v6mr3966688lfc.113.1538357544611; 
	Sun, 30 Sep 2018 18:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <1537929391-32035-1-git-send-email-Qi.Chen@windriver.com>
	<195d65f8-15f6-41e7-c3bc-53aff2ddf57b@windriver.com>
In-Reply-To: <195d65f8-15f6-41e7-c3bc-53aff2ddf57b@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 30 Sep 2018 21:32:13 -0400
Message-ID: <CADkTA4PtYQu0u4c2XdOMDmNXAJievxdMk_Q5QMif5LFfceytNA@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org,
	Mark Asselstine <mark.asselstine@windriver.com>
Subject: Re: [m-c-s][PATCH 1/7] glusterfs: fix CVE-2018-10911
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Oct 2018 01:32:27 -0000
Content-Type: text/plain; charset="UTF-8"

I almost always let patches sit for 3 or more days to allow people
time to comment.

This is now merged.

Bruce
On Fri, Sep 28, 2018 at 10:45 PM ChenQi <Qi.Chen@windriver.com> wrote:
>
> ping
>
> On 09/26/2018 10:36 AM, Chen Qi wrote:
> > Backport patch to fix the following CVE.
> >
> > CVE: CVE-2018-10911
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >   ...-negative-key-value-length-while-unserial.patch | 39 ++++++++++++++++++++++
> >   recipes-extended/glusterfs/glusterfs.inc           |  1 +
> >   2 files changed, 40 insertions(+)
> >   create mode 100644 recipes-extended/glusterfs/files/0001-dict-handle-negative-key-value-length-while-unserial.patch
> >
> > diff --git a/recipes-extended/glusterfs/files/0001-dict-handle-negative-key-value-length-while-unserial.patch b/recipes-extended/glusterfs/files/0001-dict-handle-negative-key-value-length-while-unserial.patch
> > new file mode 100644
> > index 0000000..cb3400b
> > --- /dev/null
> > +++ b/recipes-extended/glusterfs/files/0001-dict-handle-negative-key-value-length-while-unserial.patch
> > @@ -0,0 +1,39 @@
> > +From 428ee988df7d6cbe6e18becffcee5cdfb0fa9d17 Mon Sep 17 00:00:00 2001
> > +From: Amar Tumballi <amarts@redhat.com>
> > +Date: Tue, 24 Jul 2018 13:25:12 +0530
> > +Subject: [PATCH 1/7] dict: handle negative key/value length while unserialize
> > +
> > +Fixes: bz#1625089
> > +Change-Id: Ie56df0da46c242846a1ba51ccb9e011af118b119
> > +Signed-off-by: Amar Tumballi <amarts@redhat.com>
> > +
> > +Upstream-Status: Backport
> > +
> > +Fix CVE-2018-10911
> > +
> > +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > +---
> > + libglusterfs/src/dict.c | 7 +++++++
> > + 1 file changed, 7 insertions(+)
> > +
> > +diff --git a/libglusterfs/src/dict.c b/libglusterfs/src/dict.c
> > +index 839b426..ac0a677 100644
> > +--- a/libglusterfs/src/dict.c
> > ++++ b/libglusterfs/src/dict.c
> > +@@ -2751,6 +2751,13 @@ dict_unserialize (char *orig_buf, int32_t size, dict_t **fill)
> > +                 vallen = ntoh32 (hostord);
> > +                 buf += DICT_DATA_HDR_VAL_LEN;
> > +
> > ++                if ((keylen < 0) || (vallen < 0)) {
> > ++                        gf_msg_callingfn ("dict", GF_LOG_ERROR, 0,
> > ++                                          LG_MSG_UNDERSIZED_BUF,
> > ++                                          "undersized length passed "
> > ++                                          "key:%d val:%d", keylen, vallen);
> > ++                        goto out;
> > ++                }
> > +                 if ((buf + keylen) > (orig_buf + size)) {
> > +                         gf_msg_callingfn ("dict", GF_LOG_ERROR, 0,
> > +                                           LG_MSG_UNDERSIZED_BUF,
> > +--
> > +2.7.4
> > +
> > diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
> > index ab63a9a..ea5f2b7 100644
> > --- a/recipes-extended/glusterfs/glusterfs.inc
> > +++ b/recipes-extended/glusterfs/glusterfs.inc
> > @@ -23,6 +23,7 @@ SRC_URI += "file://glusterd.init \
> >               file://0001-shared-storage-Prevent-mounting-shared-storage-from-.patch \
> >               file://0002-server-auth-add-option-for-strict-authentication.patch \
> >               file://0003-glusterfs-access-trusted-peer-group-via-remote-host-.patch \
> > +            file://0001-dict-handle-negative-key-value-length-while-unserial.patch \
> >              "
> >
> >   LICENSE = "(LGPLv3+ | GPLv2) & GPLv3+ & LGPLv3+ & GPLv2+ & LGPLv2+ & LGPLv2.1+ & Apache-2.0"
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

