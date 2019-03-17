Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0B68DE00D23; Sat, 16 Mar 2019 17:23:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 40DFDE00754
	for <meta-virtualization@yoctoproject.org>;
	Sat, 16 Mar 2019 17:23:36 -0700 (PDT)
Received: by mail-lj1-f193.google.com with SMTP id y6so2722214ljd.12
	for <meta-virtualization@yoctoproject.org>;
	Sat, 16 Mar 2019 17:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uVbOg3rFmlRsRj3opX0XAqoG/qtDpmuCUnXXbKYnIC4=;
	b=P//C+LbxebcIZVNPZ7RpgkmkzAAD8CgK5EOvi8hmaKUqayG5X2JmSEVQa2tQDkao2l
	0km80qKRvZnH9EZakNAC3DGQ64I2kSuTpzQvX8j58aXxe0aHWfo3it5IfwCmwPavugh0
	IGaL+WFVlqILN2baVOKkn2w698ZFH62m4q04BwEEuVBa3glICrxGx6InDLC6BPn2dvjQ
	YRXqL6sVHB+RD5uk3HwoJlgUv1kJRxLL7z7jvjAMQ7H59Em721woQsNei12P0UPvroeG
	u8GQRLlUWKfFtn51khY7ByHd7FHzJkHo+OvVv6TmyXNs4+jXBpVxgtYkSDVpV92fJG7T
	95xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uVbOg3rFmlRsRj3opX0XAqoG/qtDpmuCUnXXbKYnIC4=;
	b=TXzcK6Yf2T2rTNUbyDrkozm4uYqKT6TcJNuC7kH734E2I0cAoxrIz93CE8icfnk4qz
	p//wNTjnJse4X4OWK4xTk5qRyx3E+wfmHsHCauL+9LhJlNUWGAts70Mv1vcceyJ8WlKV
	Dl1+KCx3mpLhx9zwzeqdXmC5edp3QRrq+b+ybrlNV9O9LkFtdbxE6Dfvyn4C+p8hf1KA
	3zocA2Jyo+J+vseHnJGX03emKvylh+QT6zsuDuim+rzMKqVlk+jPbl/S3pGZxCD8Fxs7
	a/gDoAWlvPeHik4w8Lnmdtd0kHMd4CP/jhfpQw6kQliCd/DE5Mias06iaJPG3tILtk9A
	G6lQ==
X-Gm-Message-State: APjAAAXXH6lR1hTXzmfxV8lxVyqE90137Dechk3d6gdevCngGk4asxTL
	pG0BUkVcpi+iilUlBC1p8Lv4drVHPY+He3GusPbJeA==
X-Google-Smtp-Source: APXvYqyg7afbgzkMGoh5DS0ak8bnSWishuPCP1rG+26lSCCaYGJgkxVAdZCN9TaF8UOVytLARaXUY9HYxovqTdOoRDY=
X-Received: by 2002:a2e:6350:: with SMTP id x77mr4358626ljb.191.1552782215081; 
	Sat, 16 Mar 2019 17:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190315085532.79535-1-hongzhi.song@windriver.com>
In-Reply-To: <20190315085532.79535-1-hongzhi.song@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 16 Mar 2019 20:23:24 -0400
Message-ID: <CADkTA4NOy2Ki9-9rRrd0DKhCTksNH5UJZC-RVjqRrMjCDCEZbg@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 0/2] uprev nagios-core and nagios-nsca
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
X-List-Received-Date: Sun, 17 Mar 2019 00:23:37 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Mar 15, 2019 at 4:55 AM Hongzhi.Song <hongzhi.song@windriver.com> wrote:
>
> nagios-core: from v4.4.2 to v4.4.3
> nagios-nsca: from v2.9.1 to v2.9.2
>
> Hongzhi.Song (2):
>   nagios-nsca: uprev to v2.9.2
>   nagios-core: uprev to v4.4.3
>
>  ...ios-core_4.4.2.bb => nagios-core_4.4.3.bb} |  4 +-
>  ...1-Fix-missing-argument-in-open-calls.patch | 52 -------------------
>  ...ios-nsca_2.9.1.bb => nagios-nsca_2.9.2.bb} |  9 ++--
>  3 files changed, 6 insertions(+), 59 deletions(-)
>  rename recipes-extended/nagios/{nagios-core_4.4.2.bb => nagios-core_4.4.3.bb} (97%)
>  delete mode 100644 recipes-extended/nagios/nagios-nsca/0001-Fix-missing-argument-in-open-calls.patch
>  rename recipes-extended/nagios/{nagios-nsca_2.9.1.bb => nagios-nsca_2.9.2.bb} (88%)
>
> --
> 2.17.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

