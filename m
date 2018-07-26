Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6BB0CE00CE7; Thu, 26 Jul 2018 07:40:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BB3D8E00CDD
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Jul 2018 07:40:52 -0700 (PDT)
Received: by mail-lj1-f193.google.com with SMTP id p10-v6so1724354ljg.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Jul 2018 07:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Jy7gU0k8lb4mHm1yDAdgVu7mHyO1vwDkqdf8SbmGHMI=;
	b=dzoc6VF5QTxyMIM02KLJ//gUUxSV4qBLCc+/fIP1XTVXX38Y83iXLUWQARkDvQWbx1
	Fx6GAo5uFXSvZQGo/B+BF/aVeHhLDX2nZCIotbR8Nhz+OXnu1+qR2Wj9CwNKWOf48tsq
	jqbhp2F4NwtIwteMX7dfqScNxTG/R7CrfpsRqvGGUd1VsYubKRDPS4acP9T551pWwRg2
	XPKE0jVy7/yUfiLG00qfpXYz6uiy5lhYuUo6yeP6/GgIzDYODNiESvZiDASWeWLQdYHz
	C0EVgM78T9RVe8gabs0cZY86G8B3tso70rTWzqN5JDsDDjjdZ6VFevXTCzK48phU9E9i
	sZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Jy7gU0k8lb4mHm1yDAdgVu7mHyO1vwDkqdf8SbmGHMI=;
	b=rrhWwDeB+qG4JIrcbw4LPkRl9vPRSfY4JWclPKEowgemZJXBbScBVaECm8Es15JQCk
	WOmnPe8HShVMEbgV1f1pO4TbVhGH3OIUFaxUqg+fmE6p8WcpF+owCz7hLzpq6/Wo3qkk
	K3kzpdCMt50a7pGICVjDjnACV2woXkJIE6SVWBGRghjjWo8vqV3/e4XFDKAt0QUO525O
	voewkEF5stQGhlhg80WTzy5wew3gTh+FX93rOngE3tvJdkyfkEkuHa50A30dR81uq/O1
	lnkrmKf4ieakfOyC70kDrprUut/6hrqWihGJKIp5j5nfdVEBievUQiVbOOpmMzaAEyfu
	Rr7A==
X-Gm-Message-State: AOUpUlGERLOFzk7lXutd+mFzjtuQKODC/al0zAK+1pzW4pca7g1wu5nb
	6uI0TrLUqkAObeTW+UDDRYcLVQHX9lUXbJ0QE0c=
X-Google-Smtp-Source: AAOMgpdJ4xCgi+4HeJPgtfWBVVXyw91Bg4sKXcmb8gZYkSOSdDzVAdHwOJM/Uk8gV/cOcSKAoSQV5Eq3yx/qVJyS4Rc=
X-Received: by 2002:a2e:9854:: with SMTP id
	e20-v6mr1919756ljj.143.1532616051812; 
	Thu, 26 Jul 2018 07:40:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP; Thu, 26 Jul 2018 07:40:51
	-0700 (PDT)
In-Reply-To: <20180724083231.32024-1-hongzhi.song@windriver.com>
References: <20180724083231.32024-1-hongzhi.song@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 26 Jul 2018 10:40:51 -0400
Message-ID: <CADkTA4NuxoeupdvRpJpfMx+jDU=hh1YqwZ8fokuMkr5vzVnS5w@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] seabios: modify SRC_URI
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
X-List-Received-Date: Thu, 26 Jul 2018 14:40:53 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, Jul 24, 2018 at 4:32 AM, Hongzhi.Song
<hongzhi.song@windriver.com> wrote:
> do_fetch fails because URL is wrong.
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  recipes-extended/seabios/seabios_1.9.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/seabios/seabios_1.9.1.bb b/recipes-extended/seabios/seabios_1.9.1.bb
> index 144b13c..9206046 100644
> --- a/recipes-extended/seabios/seabios_1.9.1.bb
> +++ b/recipes-extended/seabios/seabios_1.9.1.bb
> @@ -4,7 +4,7 @@ LICENSE = "LGPLv3"
>  SECTION = "firmware"
>
>  SRC_URI = " \
> -    https://code.coreboot.org/p/seabios/downloads/get/${PN}-${PV}.tar.gz \
> +    https://code.coreboot.org/p/seabios/downloads/${PN}-${PV}.tar.gz \
>      file://hostcc.patch \
>      "
>
> --
> 2.11.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

