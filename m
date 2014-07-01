Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E824BE006C6; Mon, 30 Jun 2014 21:39:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.45 listed in list.dnswl.org]
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B0DBE0053A
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jun 2014 21:39:32 -0700 (PDT)
Received: by mail-la0-f45.google.com with SMTP id hr17so5567712lab.32
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jun 2014 21:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Ncg95Y41kFPjqBPEl4uLXzhlz2CmWBc9LHXg23xXBoA=;
	b=tyw61PGrOHFDm7Y3D3Jjy871RWF66eWaCAveclonKRrDtlfeCe2SK7mi9cehePLpG7
	1VfrTirHjQq/luzeTctxNHJGfbWCOb+K/8ByLTUXmaHiomx+nzKzJAbk+dtpwMRiS81E
	ToKacrbs9CvzGnbQTTRP7JuxVSHjLUQUub4SFeIOjhUMzpFD8d4q83oUA4cmrZiJQ9Wp
	FGLbbFdhQme5UXqxLjCVsY5+k10ITwdk1E+Tmx5psZqaiSE7c3n2Mxs3PBpdDJ+3BncY
	GlNjsExw2bg/QdDpoiEj3gEGbv6/bhCSrVNRM5A35MeicSEn6VsyY+JNnTWHCxWUX6jP
	4t6A==
MIME-Version: 1.0
X-Received: by 10.152.29.168 with SMTP id l8mr34118527lah.35.1404189571667;
	Mon, 30 Jun 2014 21:39:31 -0700 (PDT)
Received: by 10.112.124.137 with HTTP; Mon, 30 Jun 2014 21:39:31 -0700 (PDT)
In-Reply-To: <1404164895-19815-1-git-send-email-akuster@mvista.com>
References: <1404164895-19815-1-git-send-email-akuster@mvista.com>
Date: Tue, 1 Jul 2014 00:39:31 -0400
Message-ID: <CADkTA4OXMbtPKpfcDHQxRoDAGsGLzBrDJpZEMqV+q8NqOKoczg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Armin Kuster <akuster@mvista.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 0/7] Remove use of PRINC
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
X-List-Received-Date: Tue, 01 Jul 2014 04:39:36 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 30, 2014 at 5:48 PM, Armin Kuster <akuster@mvista.com> wrote:
> PR .= instead of PRINC
>

I have a similar series staged locally, but since I'm out of the
office, I haven't
pushed them yet.

I staged these on top of that pending work, and if no one objects, I'll push
everything at the same time.

Bruce

>
> Armin Kuster (7):
>   [meta-openstack] apache2: Remove PRINC reference
>   [meta-openstack] iptables: remove PRINC reference
>   [meta-openstack] lighttpd: remove PRINC reference
>   [meta-openstack] postgressql: remove PRINC reference
>   [meta-openstack] linux-yocto_3.10: remove PRINC reference
>   [meta-openstack] linux-yocto_3.14: remove PRINC reference
>   [meta-openstack] linux-yocto_3.4: remove PRINC reference
>
>  meta-openstack/recipes-extended/apache2/apache2_2.4.9.bbappend      | 2 +-
>  meta-openstack/recipes-extended/iptables/iptables_1.4.21.bbappend   | 2 +-
>  meta-openstack/recipes-extended/lighttpd/lighttpd_1.4.35.bbappend   | 2 +-
>  meta-openstack/recipes-kernel/linux/linux-yocto_3.10.bbappend       | 3 ++-
>  meta-openstack/recipes-kernel/linux/linux-yocto_3.14.bbappend       | 2 +-
>  meta-openstack/recipes-kernel/linux/linux-yocto_3.4.bbappend        | 2 +-
>  meta-openstack/recipes-support/postgresql/postgresql_9.2.4.bbappend | 2 +-
>  7 files changed, 8 insertions(+), 7 deletions(-)
>
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

