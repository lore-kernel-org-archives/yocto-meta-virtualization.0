Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 703B5E00A38; Wed, 22 Jul 2015 13:12:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.177 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D9324E009EB
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Jul 2015 13:12:22 -0700 (PDT)
Received: by ykdu72 with SMTP id u72so202386876ykd.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Jul 2015 13:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=UoYVyEdpvnBhl4HsJM1lyggPvzpMdcgEFg9xvClc4Fo=;
	b=geZDLc3h//0sNZGL9Duu+OQdavQIHdGCL0b+/962OwfuzyXlxmbs3Z8cdSY9T0sz5y
	QHWDTbiS0bAcu+wfuZqOkukDeS5n0AOCvQzXGiqqsKsJ7CA8PRVC02SFAQcSH1Y7Jj+L
	y4N2TpW2+MBRae+OyPZyZ/9LOQYT0X/AKIN+eqWjKYovMGTyXB8r/ymJ4RsjkF8ARL9i
	nKgN+Ke8pvQENsj01ekkN6cnaCTjrgBKbIa3uV/gJAmL9yfgX2mpjANhgQyL3edOYiLZ
	mUZ+bn9ZK+NY2POoUfi0IPsrKDOZQDiaqcMi/0jFwEmh+2Oo/ieBr3ProGrwKPNoJfks
	GJUA==
MIME-Version: 1.0
X-Received: by 10.129.130.69 with SMTP id s66mr4339781ywf.62.1437595942273;
	Wed, 22 Jul 2015 13:12:22 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Wed, 22 Jul 2015 13:12:22 -0700 (PDT)
In-Reply-To: <1437556588-2083-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1437556588-2083-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Date: Wed, 22 Jul 2015 16:12:22 -0400
Message-ID: <CADkTA4NdijBYUS1Mgfc=SfgzowLRVFS=az3s3UGO4+1gAN29JQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] libconfig-general-perl: upgrade 2.51 -> 2.58
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
X-List-Received-Date: Wed, 22 Jul 2015 20:12:23 -0000
Content-Type: text/plain; charset=UTF-8

 merged:

   8fd56666ece0..d483af7aaffb  dizzy-juno -> dizzy-juno
   a05f2e523002..2cb09aa8f2f6  fido-kilo -> fido-kilo
   0b3232f74aa4..cb835dd47a75  master -> master

On Wed, Jul 22, 2015 at 5:16 AM, Li xin <lixin.fnst@cn.fujitsu.com> wrote:
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  ...libconfig-general-perl_2.51.bb => libconfig-general-perl_2.58.bb} | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta-openstack/recipes-devtools/perl/{libconfig-general-perl_2.51.bb => libconfig-general-perl_2.58.bb} (80%)
>
> diff --git a/meta-openstack/recipes-devtools/perl/libconfig-general-perl_2.51.bb b/meta-openstack/recipes-devtools/perl/libconfig-general-perl_2.58.bb
> similarity index 80%
> rename from meta-openstack/recipes-devtools/perl/libconfig-general-perl_2.51.bb
> rename to meta-openstack/recipes-devtools/perl/libconfig-general-perl_2.58.bb
> index 8535845..fd06ccc 100644
> --- a/meta-openstack/recipes-devtools/perl/libconfig-general-perl_2.51.bb
> +++ b/meta-openstack/recipes-devtools/perl/libconfig-general-perl_2.58.bb
> @@ -2,15 +2,14 @@ DESCRIPTION = "Config file parser module"
>  HOMEPAGE = "http://search.cpan.org/dist/Config-General/"
>  LICENSE = "Artistic-1.0 | GPL-1.0+"
>  SECTION = "libs"
> -PR = "r0"
>  LIC_FILES_CHKSUM = "file://README;beginline=90;endline=90;md5=3ba4bbac1e79a08332688196f637d2b2"
>
>  SRCNAME = "Config-General"
>
>  SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TL/TLINDEN/${SRCNAME}-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "3100325f99bdc2f265645a842e6bb025"
> -SRC_URI[sha256sum] = "8ff530cd4818a040c1bc2ba96e3e8237241dde1208d206685d1204270ef00bce"
> +SRC_URI[md5sum] = "79397bfbf32dbe772bdc2167afc5c5a6"
> +SRC_URI[sha256sum] = "d63cf3f4c600a87de336db806a7def0385ba5e3a9be427e0c65e407558b82eef"
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> --
> 1.8.4.2
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

