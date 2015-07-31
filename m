Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 766EFE009F8; Fri, 31 Jul 2015 07:19:46 -0700 (PDT)
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
	*      [209.85.160.176 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 47EF2E009E5
	for <meta-virtualization@yoctoproject.org>;
	Fri, 31 Jul 2015 07:19:39 -0700 (PDT)
Received: by ykdv124 with SMTP id v124so19498413ykd.0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 31 Jul 2015 07:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=q9k7//51wbIEVI1g7S5/Qwrv2kOQaEUR+2m4xjUmcuk=;
	b=HQuZ4DQEthQAjL73WVoRyJPWW59qfyEMUTvbXuvLaEjOw9KOPi3Q+QtqxUqXSa+fTm
	wYESc8K5jHVjjb9nwNZRxOC4M18iVVFYhNXbeI+EN4C2MBXtt1RjhR8+4efkGAKuJzOD
	dZTD0GRUNmdR5JvDj1Oss2pAHlrkEOqT9lv9V2OGyUlKaFmc2irv20hWqTLrKNtNIe/F
	HNU0z+FhYhdFK4aMP0HB8FhV7Kl6AwTSOUSAfN8+ePX8xbPD6Xch2jbecz4O67Nf/X5p
	O92aDufgBbUzbvB40EYpzFr3SlGLEeeymcNtwfQetsjw5/PGm3Oo40ARo3mirfioQGex
	HbZg==
MIME-Version: 1.0
X-Received: by 10.170.186.140 with SMTP id c134mr3593232yke.54.1438352379342; 
	Fri, 31 Jul 2015 07:19:39 -0700 (PDT)
Received: by 10.13.226.203 with HTTP; Fri, 31 Jul 2015 07:19:39 -0700 (PDT)
In-Reply-To: <1438320602-17454-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1438320602-17454-1-git-send-email-leimaohui@cn.fujitsu.com>
Date: Fri, 31 Jul 2015 10:19:39 -0400
Message-ID: <CADkTA4OoZinY9vfO-DE+RQ1PjgzFHSQAA=JMGM3eg71zT53R9A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Lei Maohui <leimaohui@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-simplejson: upgrade 3.6.2->3.7.3
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
X-List-Received-Date: Fri, 31 Jul 2015 14:19:46 -0000
Content-Type: text/plain; charset=UTF-8

Thanks.

I've merged all the updates to master.

One request though. If something is for meta-cloud-services, versus
meta-virtualization,
it is worth mentioning as [meta-cloud-services] or [m-c-s] in the
subject .. I had to dig
through the two different layers to apply the updates.

Cheers,

Bruce

On Fri, Jul 31, 2015 at 1:30 AM, Lei Maohui <leimaohui@cn.fujitsu.com> wrote:
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  .../python/{python-simplejson_3.6.2.bb => python-simplejson_3.7.3.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename recipes-devtools/python/{python-simplejson_3.6.2.bb => python-simplejson_3.7.3.bb} (84%)
>
> diff --git a/recipes-devtools/python/python-simplejson_3.6.2.bb b/recipes-devtools/python/python-simplejson_3.7.3.bb
> similarity index 84%
> rename from recipes-devtools/python/python-simplejson_3.6.2.bb
> rename to recipes-devtools/python/python-simplejson_3.7.3.bb
> index ecc4679..39dfce6 100644
> --- a/recipes-devtools/python/python-simplejson_3.6.2.bb
> +++ b/recipes-devtools/python/python-simplejson_3.7.3.bb
> @@ -13,8 +13,8 @@ PR = "r0"
>  SRCNAME = "simplejson"
>
>  SRC_URI = "https://pypi.python.org/packages/source/s/simplejson/${SRCNAME}-${PV}.tar.gz"
> -SRC_URI[md5sum] = "deca871b9bfa4b76ea360756b2a22710"
> -SRC_URI[sha256sum] = "99c092209f88d411858f01b14a97a4fcf8c4f438a685e23d733a3d65de52a35d"
> +SRC_URI[md5sum] = "117346e5ee4ed4434ffe485f8e58f5ed"
> +SRC_URI[sha256sum] = "63d7f7b14a20f29f74325a69e6db45925eaf6e3a003eab46c0234fd050a8c93f"
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

