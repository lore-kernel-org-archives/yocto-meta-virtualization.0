Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 59204E00563; Mon,  7 Jul 2014 09:20:55 -0700 (PDT)
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
	*      [209.85.215.50 listed in list.dnswl.org]
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3419E003C1
	for <meta-virtualization@yoctoproject.org>;
	Mon,  7 Jul 2014 09:20:48 -0700 (PDT)
Received: by mail-la0-f50.google.com with SMTP id pv20so3063297lab.37
	for <meta-virtualization@yoctoproject.org>;
	Mon, 07 Jul 2014 09:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=aRRHJ0QFR2WaH8wjyTeLklGflgIbgI/JerZJx8DluBM=;
	b=wiDLECGkE/62X+lvHODskciAA0rxtMw9c45fHv5ROwt374KplSyx6RQc9xpHFRH2ea
	rFuD98jP2uMVIUo2Cj3dMgizDpByDnSXGEcq1brqZ4R/qckFyJXkMQcqDZv45pbmtKIG
	bGSw75KcdnHyefwETQfw0MLcip0XHqszqQ78d67W/dlA74vwEa2Sf1CxzDVwZA1Bp5Bn
	imxmNsoJO5lkPjqUSYD3OINvJ/GUTAEyosUPx2O9Ls9nr16xvTbzPTqrs6n64WqoIg6O
	Y1DUd5O5WFvhfbX7zMOWIAbMFBJKAVhVkE0vJy36bHktkwUP+oc/BVn+oq1X2tB2aiBl
	zpWQ==
MIME-Version: 1.0
X-Received: by 10.152.115.173 with SMTP id jp13mr5561321lab.6.1404750047546;
	Mon, 07 Jul 2014 09:20:47 -0700 (PDT)
Received: by 10.112.124.137 with HTTP; Mon, 7 Jul 2014 09:20:47 -0700 (PDT)
In-Reply-To: <1404394090-25834-1-git-send-email-Christian.Ziethen@enea.com>
References: <1404394090-25834-1-git-send-email-Christian.Ziethen@enea.com>
Date: Mon, 7 Jul 2014 12:20:47 -0400
Message-ID: <CADkTA4PFtBUO+sVNq55+xnFj2SA8+BHWXMAEPb8ArYiDAD-rhQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: =?UTF-8?Q?Christian_Zieth=C3=A9n?= <Christian.Ziethen@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v1] Replace module_autoload with KERNEL_MODULE_AUTOLOAD
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
X-List-Received-Date: Mon, 07 Jul 2014 16:20:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2014 at 9:28 AM, Christian Zieth=C3=A9n
<Christian.Ziethen@enea.com> wrote:
> linux-yocto_3.14: Replace module_autoload with KERNEL_MODULE_AUTOLOAD
>
> Christian Zieth=C3=A9n (1):
>   linux-yocto_3.14: Replace module_autoload with
>     KERNEL_MODULE_AUTOLOAD
>

merged. I had a similar commit, so I took yours and left 3.4/3.10 in mine.

Cheers,

Bruce

>  recipes-kernel/linux/linux-yocto_3.14.bbappend | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

