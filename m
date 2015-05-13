Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 15641E0097D; Wed, 13 May 2015 13:52:25 -0700 (PDT)
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
	*      [209.85.160.175 listed in list.dnswl.org]
Received: from mail-yk0-f175.google.com (mail-yk0-f175.google.com
	[209.85.160.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA6C0E008DC
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 May 2015 13:52:20 -0700 (PDT)
Received: by ykep21 with SMTP id p21so18148473yke.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 May 2015 13:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=zsnvceDSDWg9MC2MBH4NPUivuzR6KKFxcEGmYgNvMiQ=;
	b=M5ryc+e9cmUErQbdmi7mbYZNLcPku2U0wmdrbs5MyfpILbNQtvd1f9+htWYWA37dYb
	hWkJlG8RASrOiGLba9M7M7kXg+IMad4Ph9dteXJEqZfwBwlnKxhXnT86EVQGxgur5xjR
	2G8qIRLq3EzVBs/Leq9HpiCqiCzV8JH1w+3MXkD4RkIN1Jedqatm9wL5Nm9LuBPhz55H
	azaCysKkoMQtZWzFpIU2do8LKiNRwh3kXS7ekeW+cOU4HvBdlCGtcCupAG0DDB81msoE
	eCZPn00aiXMjmOtv39oNIlM7/glkVjW2U79gscKzfxzjKb5SgjNHMEbkdcST4Kd27Nu4
	zeIw==
MIME-Version: 1.0
X-Received: by 10.170.34.4 with SMTP id 4mr899327ykc.62.1431550339951; Wed, 13
	May 2015 13:52:19 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Wed, 13 May 2015 13:52:19 -0700 (PDT)
In-Reply-To: <1431498366-8264-1-git-send-email-jackie.huang@windriver.com>
References: <1431498366-8264-1-git-send-email-jackie.huang@windriver.com>
Date: Wed, 13 May 2015 16:52:19 -0400
Message-ID: <CADkTA4MPhqDehZ+pq7UQfbh9FYOdDFT8WuGQsAqxipZkyjoZZA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Huang, Jie (Jackie)" <jackie.huang@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-simplejson: inherit setuptools instead of distutils
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
X-List-Received-Date: Wed, 13 May 2015 20:52:25 -0000
Content-Type: text/plain; charset=UTF-8

I should have all the series merged now, take a look, and if I missed
anything .. point it out.

Bruce

On Wed, May 13, 2015 at 2:26 AM,  <jackie.huang@windriver.com> wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  recipes-devtools/python/python-simplejson_3.6.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-devtools/python/python-simplejson_3.6.2.bb b/recipes-devtools/python/python-simplejson_3.6.2.bb
> index f13f1f3..ecc4679 100644
> --- a/recipes-devtools/python/python-simplejson_3.6.2.bb
> +++ b/recipes-devtools/python/python-simplejson_3.6.2.bb
> @@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "99c092209f88d411858f01b14a97a4fcf8c4f438a685e23d733a3d65de
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> -inherit distutils
> +inherit setuptools
>
>  RDEPENDS_${PN} = "\
>      python-core \
> --
> 2.3.5
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

