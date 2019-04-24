Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6DEBEE00C1B; Wed, 24 Apr 2019 12:25:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (asselsm[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.174 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
	[209.85.167.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D12F3E00B58
	for <meta-virtualization@yoctoproject.org>;
	Wed, 24 Apr 2019 12:25:31 -0700 (PDT)
Received: by mail-oi1-f174.google.com with SMTP id e5so15273999oii.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 24 Apr 2019 12:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=i5K7+jUSRnXXyhV0hc1Oefg3EEycqtqxKI+gAwuriZo=;
	b=XztMver684JFEfPz7F9bOPXWVZLdAvjSyZTHMJvmG/4t0B2WORpabBOoOqvLV54QHl
	1qUlWTy9hUVkOfXnOwTbJOnDlhpWkvmhSI1kZhvtfF3HCQLHKCqJ22rU04eeCuCuZp2E
	kLdYc0JYx85zVr2jl/ZKwPzM1mGBOCFltO1HOyZqeLJw1AjikDez0rz2XfJk0k0myYvP
	uzDnrBQ/HitV5LUXA0ufRmERIa+kCCcBP5lRuWuLgD2KT4bR5vzPi6loZAIgO2/vOQgv
	QbbVMyogDeA7jRDZlM/YWa2CVaJM2ZBx7FDjfA7srGqTCoWC1+NwtG48BtT/WgKcxwQa
	0g9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=i5K7+jUSRnXXyhV0hc1Oefg3EEycqtqxKI+gAwuriZo=;
	b=d6+gOr90pN+ssSSTMqck7cUvPEjILXx4i2mfIQ/sKgtjcbnNQSVPEIqxUKOR0P7tnU
	a0ufdRfPa7LyM8Jxz1bcX6IaghWAZs7dPXzyemutldLX6WD6yD+pI6UBJlBXAY+sSL3V
	jEvEeRKg1OnpdGPxtNyVuszPDIuFzwjzsdotJjGDpYSowyv8CZFzcHI2c9BWZVLw0nl1
	x6yvAa8iKJyDq1GQyCuJ4O/sgJPMmfLRWGk3/dbCq0RbygVZSF7mgRV0WhdFoKz3cxwm
	2rEVh3YfmXeqfR1BXZjTWdeNLgMS1/1AFRTm3ob9Ztt4T3WxrfaiSrknigdLXzIWKg5e
	4P9A==
X-Gm-Message-State: APjAAAU4w6LlcJm/29PAwve00U9IiHpQ7hGUo6XjNku5UtdwOazPb0QE
	F4TnxUE2ZWsIvBT03IYhuR2LlB/zribI3TMS2GB3sMKd
X-Google-Smtp-Source: APXvYqwuVi7gXnWWkcnf86Qe+4XQpVeWEHoMUjW7PZ/LuzSqLVA8Z9Ss3fITACc/N/9Irv42Wim5E/94hRY9u4K/O5g=
X-Received: by 2002:aca:3fd7:: with SMTP id m206mr498996oia.112.1556133930777; 
	Wed, 24 Apr 2019 12:25:30 -0700 (PDT)
MIME-Version: 1.0
References: <16a4a726e0c.108895fa735894.3116322584750949290@apertussolutions.com>
In-Reply-To: <16a4a726e0c.108895fa735894.3116322584750949290@apertussolutions.com>
From: Mark Asselstine <asselsm@gmail.com>
Date: Wed, 24 Apr 2019 15:25:19 -0400
Message-ID: <CAPuovE+daXfgHUzbgomeVTEBsKAe_Q2dHmL_4Nib8x=eEUd3ng@mail.gmail.com>
To: Ken Bassford <kbassford@apertussolutions.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: Problems building under go.
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
X-List-Received-Date: Wed, 24 Apr 2019 19:25:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2019 at 10:31 AM Ken Bassford
<kbassford@apertussolutions.com> wrote:
>
> Hello Folks,
>
> I am currently attempting to bring in 16 Go modules ("kmip-go" plus all d=
ependencies) into my OpenXT project and a select few are having problems co=
mpiling.  The modules that fail, fail during do_compile_ptest_base with a "=
vet config not found".  I have attempted to use the PTEST_ENABLED_${PN} =3D=
 "0" or PTEST_ENABLED =3D "0" flags to no avail as these settings are being=
 ignored.  The modules in question are "github.com/mattn/go-isatty" and "gi=
thub.com/uber-go/multierr".
>
> I am hoping that one or more of you in this audience that are familiar wi=
th compiling golang modules in a OpenXT bitbake environment might be able t=
o point me in the right direction.

I don't know much about these modules but I do have my fingers in the
go classes so I might be able to help. Can you type out the
instructions I might be able to follow to reproduce this, ie. which
layers and recipes go boom?

MarkA


>
> Thanks in advance.
>
> Sincerely,
> Ken Bassford
> Apertus Solutions
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

