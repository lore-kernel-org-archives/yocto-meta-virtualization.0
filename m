Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D98C3E01080; Wed, 14 Mar 2018 05:43:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.66 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0569EE00B66
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Mar 2018 05:43:27 -0700 (PDT)
Received: by mail-lf0-f66.google.com with SMTP id m69-v6so4548479lfe.8
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Mar 2018 05:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cgesh7TFKKWGlkvoYUVZ5zjE9cJPNuhv+PYUMd16NsU=;
	b=qSwDDT5GvPZZOYOh8NKI7GO93mLjhrTf0oMBmxYprRAzxSi9Ioe1XSh4B02igavVHT
	uiBil+WxwDG5yUzsr6G343H4nIQn6RI8880Pgup4xq1vcxySzYrv09Ze8dAnSDDTSlUX
	z95j85gBXeGcoTu5KRUWPMosWv8XKoKaFyx7g+KIa/Utqv5BgEL92r1JcPd2u1gROLNP
	/zv9efF8/Mii49oo0ApILkq5c120H9HUC10USbSW/jvjQdg84b563G4ARdPc5mXw9gtX
	4RSqt/xL2itjJ7rQc46yf/dNQ5HQYPlE2NdcmzRuO+mdR7BoqhU1gA+mjrpIL2urMgMX
	JHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cgesh7TFKKWGlkvoYUVZ5zjE9cJPNuhv+PYUMd16NsU=;
	b=BhBmiHbBS45cvihV9Z2LIvG52wkdmcmAyu1GhrAyK1I/dgNOnKQtdCdr61NcISppJZ
	9G7W5iz4Msxc95RpOOjmtxqdIMef3pBhDBHO2OpjJW80VBfGGBapI607fjNyy7hgguoX
	m7fmL7a1sDiI3Fr+UxVPwiFLQmzyeQqmG98WL0nYsxVvlka0ZidllhOc3Z6LqriVA/C7
	/8oUx0oH1zGYB8QdjeCbVkgi6ke4B3sTn0UVhhskqCXBXlztcUcXPVAnTWq4NRPfOjtt
	KZQejqqCmqcWMIjpUkvGG9aae7FB73NbZYOCxxVsyR+xPQ+U9c9m4rJSMfGQEy60hb3l
	i52g==
X-Gm-Message-State: AElRT7HKmUcH+B0sqJTNINTS1xAaw8X7mfWz+LA5ceDD/X4Ct3aAoyd/
	CpHLBq0twPNvY+VeEHD4BPtFA/7CPhU5H8bUHyU=
X-Google-Smtp-Source: AG47ELseiy/PdTYc68sL1z9OxkYbgkQWpPXYn4QbUSpSaWDxJZNioS69RUEZGe0d9YIKxpcGoOncNZzMGSHqaeNk+to=
X-Received: by 2002:a19:5c4b:: with SMTP id
	q72-v6mr3483792lfb.126.1521031406657; 
	Wed, 14 Mar 2018 05:43:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Wed, 14 Mar 2018 05:43:25 -0700 (PDT)
In-Reply-To: <20180313153418.13771-1-pascal.bach@siemens.com>
References: <20180313153418.13771-1-pascal.bach@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 14 Mar 2018 08:43:25 -0400
Message-ID: <CADkTA4Pqe5G5=Vs1o86nDtK+taWe14ZMdwbGctWmC5VmoK1iqA@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] README: remove reference to oe-meta-go
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
X-List-Received-Date: Wed, 14 Mar 2018 12:43:28 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Tue, Mar 13, 2018 at 11:34 AM, Pascal Bach <pascal.bach@siemens.com> wrote:
> It is no longer supported nor is it it needed as the support has
> landed in openembedded-core
>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  README | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/README b/README
> index d653f11..6d8fbe0 100644
> --- a/README
> +++ b/README
> @@ -39,14 +39,10 @@ URI: git://github.com/openembedded/meta-openembedded.git
>  branch: master
>  revision: HEAD
>  layers: meta-oe
> -       meta-networking
> +        meta-networking
>          meta-filesystems
>          meta-python
>
> -URI: git://github.com/errordeveloper/oe-meta-go.git
> -branch: master
> -revision: HEAD
> -
>  BBFILE_PRIORITY_openembedded-layer = "4"
>
>  Required for Xen XSM policy:
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

