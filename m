Return-Path: <richard.purdie@linuxfoundation.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7AA91E00B6F; Wed, 10 Oct 2018 00:10:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.221.50 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3587DE0097C
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Oct 2018 00:10:37 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id y11-v6so4392082wrd.4
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Oct 2018 00:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gkIp+HpnltKDuqmpnsIaN6QD+mAul1urDwhNX9n6Cf0=;
	b=Z1e48BrONOBrrYUoAxeqC8C5Qdb/Q6bEM7uG4XM4T+MXOaH8fkw2DU+/paVQWDQA4e
	jHLL+maKuZ/lF+vN4CJq0jtKmNbfyZYETslvuKQQA4UwA6IzEDvlgySjPkfXW92dEvgO
	jIZ5khdf/kFsqrSTEjPxayRgy3mcVhB+/zVoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gkIp+HpnltKDuqmpnsIaN6QD+mAul1urDwhNX9n6Cf0=;
	b=T0teP4g+JKNs/00m2JFZsJ5/ROPTVy4GGyZ5uCfgXlz9EsQB9MP0nGvXeQdOAbhOgC
	v8MhaDg0wXbYbowsPLN3LEbpjNeU1dH0V09S+4pTMncznQSxfgYeho/F7AYIgZn7UrUu
	B9wh+KDToq/mvBLIRBXqnwJPU5aLGhUNlD1wWk4JIe7vPBvNksdY1FCy8EPqUYY6ESIF
	k3SS4iE9fmzJF5b+cLC7FL+kTUW+doRyyUFr4rXstbz3UHp1GxqLiYx9NhjgSOR7qQFB
	CElKdUWqzACGcb4y6fw/FethGO/r9Ymgmh+KrhZVqryg6BS1C5hXLKGMT8dxOwHNCHGK
	nIiQ==
X-Gm-Message-State: ABuFfojmbaR16pPxtMUtj8iIfwPiuTfprwKtZOMHPo2u4Xg4qxv7o8KH
	0xa5+9l7Fbl+EKda+/NzOZOXJg==
X-Google-Smtp-Source: ACcGV60nxdOUeVWltE0LjkSwj6+/FfuP2mL6JNIRI4vgqmrdm5v2arqC/LWbg6d/rTkO44DUGGCxJg==
X-Received: by 2002:adf:e886:: with SMTP id d6-v6mr2046580wrm.7.1539155436090; 
	Wed, 10 Oct 2018 00:10:36 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x8-v6sm39980558wrd.54.2018.10.10.00.10.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 10 Oct 2018 00:10:34 -0700 (PDT)
Message-ID: <4c409c13ecd1811337d0c2e465d67fbecdd99a0c.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Dengke Du
	<dengke.du@windriver.com>
Date: Wed, 10 Oct 2018 08:10:33 +0100
In-Reply-To: <CADkTA4PtUQtntuRa9Ynbn6YLa8_wvE7a1_b8-BVO5HM1+WuOng@mail.gmail.com>
References: <1539136093-3457-1-git-send-email-dengke.du@windriver.com>
	<CADkTA4PtUQtntuRa9Ynbn6YLa8_wvE7a1_b8-BVO5HM1+WuOng@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH V3] ceph: only support x86-64
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
X-List-Received-Date: Wed, 10 Oct 2018 07:10:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

You may want to delete 0001-ceph-only-support-x86-64.patch then ;-)

Cheers,

Richard

On Tue, 2018-10-09 at 23:26 -0400, Bruce Ashfield wrote:
> v3 is merged.
> 
> Bruce
> 
> On Tue, Oct 9, 2018 at 9:49 PM Dengke Du <dengke.du@windriver.com>
> wrote:
> > 
> > Signed-off-by: Dengke Du <dengke.du@windriver.com>
> > ---
> >  0001-ceph-only-support-x86-64.patch  | 22 ++++++++++++++++++++++
> >  recipes-extended/ceph/ceph_13.2.1.bb |  1 +
> >  2 files changed, 23 insertions(+)
> >  create mode 100644 0001-ceph-only-support-x86-64.patch
> > 
> > diff --git a/0001-ceph-only-support-x86-64.patch b/0001-ceph-only-
> > support-x86-64.patch
> > new file mode 100644
> > index 0000000..c907e23
> > --- /dev/null
> > +++ b/0001-ceph-only-support-x86-64.patch
> > @@ -0,0 +1,22 @@
> > +From c1410631e368569f8fa03a2a72938e603eb92578 Mon Sep 17 00:00:00
> > 2001
> > +From: Dengke Du <dengke.du@windriver.com>
> > +Date: Mon, 8 Oct 2018 15:33:25 +0800
> > +Subject: [PATCH V2] ceph: only support x86-64
> > +
> > +Signed-off-by: Dengke Du <dengke.du@windriver.com>
> > +---
> > + recipes-extended/ceph/ceph_13.2.1.bb | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/recipes-extended/ceph/ceph_13.2.1.bb b/recipes-
> > extended/ceph/ceph_13.2.1.bb
> > +index d7186b9..7888e64 100644
> > +--- a/recipes-extended/ceph/ceph_13.2.1.bb
> > ++++ b/recipes-extended/ceph/ceph_13.2.1.bb
> > +@@ -60,3 +60,4 @@ FILES_${PN}-dev += "\
> > + RDEPENDS_${PN} += "\
> > +               python \
> > + "
> > ++COMPATIBLE_MACHINE = "(qemux86-64|intel-x86-64)"
> > +--
> > +2.7.4
> > +
> > diff --git a/recipes-extended/ceph/ceph_13.2.1.bb b/recipes-
> > extended/ceph/ceph_13.2.1.bb
> > index d7186b9..e89bbeb 100644
> > --- a/recipes-extended/ceph/ceph_13.2.1.bb
> > +++ b/recipes-extended/ceph/ceph_13.2.1.bb
> > @@ -60,3 +60,4 @@ FILES_${PN}-dev += "\
> >  RDEPENDS_${PN} += "\
> >                 python \
> >  "
> > +COMPATIBLE_HOST = "(x86_64).*"
> > --
> > 2.7.4
> > 
> 
> 


