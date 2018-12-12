Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E32E6E00C8F; Wed, 12 Dec 2018 11:17:20 -0800 (PST)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.167.65 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3CF0AE00A54
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Dec 2018 11:17:20 -0800 (PST)
Received: by mail-lf1-f65.google.com with SMTP id n18so14399098lfh.6
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Dec 2018 11:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QJgNRLt5eF7y8VLLeYYaqPCNL4G4kteXH44mJMRdb4Y=;
	b=jCPA0R9z2kjORzyO95IVZFKZbwzErO52LJZxakZCTkbiSVbt7aOY0oIPlQeIO/slwy
	ozHx0auc5/TX3WIuRYhgmfrlpjInTfZ+QlibTfmRiccoacVL96iaUtnh6zhbSw9z1n2v
	5DMLGUt/JG8I0v52c/PtdkMaOONeX0YYZ81QAoLJ0o/5F0Kt38vMDpA4cAR++1vyQROl
	BDBak6RNGDKWmKAWI6rgmYaPXCXstyShphaKY4UMQVXyqxMNdrEXWHfkekrp5k85CGM/
	fstqyaHo7+wT1nNYiCOH9xPhs3p1a8dYXQNPH3BnBhkFNj/vVmpVGQGEMfFH9zGTsQcF
	aIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QJgNRLt5eF7y8VLLeYYaqPCNL4G4kteXH44mJMRdb4Y=;
	b=keBjafH4QtEt1ZANxUXLViE/LyD9qS66Ik+FhqY2yZTnGUTTj/FO5ucH05Z47Lm6qY
	A0prTUVJTFJ5Ud2hbwX9OjzZ8DvWTfWQgyzXBTCH/Metb9XNZrE6u6+4ICvWo4e38KKx
	6Q/jdTukLgDOGSjBLX5+ArNeG4SGdIwzQBzCA4hEjJdItnfEybLlmXhO+dLyPatsbqG8
	rQo3FOoFs4WdNry5MA4KUuXmR/nJiIzbJ4DTjG0qmORtmJbndz3S25a5W/aOhVBrnRDe
	UM1lQ4JvKEdpmyYA89qQb8l7q8jBFLWHdsaIfR6nDFQ/tGAZ8uc+ivr151YBXgf9H5EH
	L4GA==
X-Gm-Message-State: AA+aEWauZqQppEzWFGLa1ocL/mAOR4Tg+u0LO8l4HZfiSVXJAlJmiOFQ
	u62p4h8MZgS5djFs/iaJkzUc/bGyqaRumWb8EvWkww==
X-Google-Smtp-Source: AFSGD/VxJvGPszyloSILganFoGDbTozkGhCAEFHgfT4/bHpBcfisks0Smnfd/komdO9Jg7JvtH+Hp/HzwLw+Z1OzfPQ=
X-Received: by 2002:a19:2c92:: with SMTP id s140mr11967006lfs.42.1544642239145;
	Wed, 12 Dec 2018 11:17:19 -0800 (PST)
MIME-Version: 1.0
References: <20181207145322.20280-1-jed.openxt@gmail.com>
In-Reply-To: <20181207145322.20280-1-jed.openxt@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 12 Dec 2018 14:17:07 -0500
Message-ID: <CADkTA4NwdCj8R3ci4kBivtiBSyn7OjSVQTVyc=3rxZXmMQemdQ@mail.gmail.com>
To: jed.openxt@gmail.com
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] xen: upgrade from 4.11.0 to 4.11.1
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
X-List-Received-Date: Wed, 12 Dec 2018 19:17:21 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce
On Fri, Dec 7, 2018 at 9:53 AM Jed <jed.openxt@gmail.com> wrote:
>
> Signed-off-by: Jed <jed.openxt@gmail.com>
> ---
>  recipes-extended/xen/{xen_4.11.0.bb => xen_4.11.1.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename recipes-extended/xen/{xen_4.11.0.bb => xen_4.11.1.bb} (76%)
>
> diff --git a/recipes-extended/xen/xen_4.11.0.bb b/recipes-extended/xen/xen_4.11.1.bb
> similarity index 76%
> rename from recipes-extended/xen/xen_4.11.0.bb
> rename to recipes-extended/xen/xen_4.11.1.bb
> index 870caa7..fea17a7 100644
> --- a/recipes-extended/xen/xen_4.11.0.bb
> +++ b/recipes-extended/xen/xen_4.11.1.bb
> @@ -10,7 +10,7 @@ SRC_URI = " \
>      file://0001-python-pygrub-pass-DISTUTILS-env-vars-as-setup.py-ar.patch \
>      "
>
> -SRC_URI[md5sum] = "cbec0600284921744bc14119f4ed3fff"
> -SRC_URI[sha256sum] = "826e3a9f6d0eac94a825d272cc2c1294e22640ae75af906eb13920f9ad667643"
> +SRC_URI[md5sum] = "0c72b97432465e7f81113630fcd6e460"
> +SRC_URI[sha256sum] = "be88cb2443761990efc1070d9718016561fe19066af232f9bfae572922897e59"
>
>  S = "${WORKDIR}/xen-${PV}"
> --
> 2.11.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

