Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 20AB3E00AB9; Mon, 20 Aug 2018 08:36:44 -0700 (PDT)
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
	*      [209.85.208.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6420DE003D7
	for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Aug 2018 08:36:43 -0700 (PDT)
Received: by mail-lj1-f195.google.com with SMTP id y17-v6so11919571ljy.8
	for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Aug 2018 08:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vDfIpEj1PIL3j2dR5+g6CNJheaIzKe+IfOGee16t6bw=;
	b=ErYu0wdgIegoSayl0vdTqHLdqM8PYbwDPtcgg/+d5aHpQMXOEmdBc0gjuvsN+w1R55
	W0n66CeixEbOSWxdHkUb00CYmOeDTJKw/jFMB7JQ4PhJWKTzXW/DdCtLYZNB410ePtdb
	dme6HVSn0iGEG/rE1uQmI7QNu7sW8lDzscgFtPRIZNsMcbjzJLeAQdiA1u0mm6fM9VSw
	J00Um6iBqIS1EMNsX79FbAbI9SLlek4gheN62hGQ5yHXv+InjVpDcckYZ/mhG4d/DxA3
	vU6C3p0F8VQGCwSAtZRVCpJCEHt1V2SOTx8X3+G/ZN7viGUVINtDrGgQsQYZc5NpA1Wt
	qU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vDfIpEj1PIL3j2dR5+g6CNJheaIzKe+IfOGee16t6bw=;
	b=WHizNRaCl2LLIRrtsV0BuwVghSfXn4mJBLdhYQvh6kFn1EwrxpZxpTdbA6sE2Dve91
	8tCbTEaAF1nrctRNfuTuXESy6m1If5/kRt4HV9hNNrl1DkBoUtmJx6wPR6Tu0y5ZmBLL
	4UJd9bOGkvd5hFRmrSYmW5Fz11f5R/eb2Wq1sBV3MSGvZLeWWzTYx8t5vWm5EjPGamSA
	TyDWdyn9A+IgYo4P98otUYEB1noX6JsUMKJwBM6ee3MbMkwxPpymrntviucl3KY8atpT
	r4FwjVZEbRCbCKYs4UHPP69+ogYFsaD9ySNkv705eMiwSpZvwJu046HrEo3YvGwjIPOf
	Mh4g==
X-Gm-Message-State: AOUpUlFzpjLB/ueNqX2+5RWT7Cb+3VHYEBJyLSaWqinCg0lDaIyR/XQb
	VwCk80HNyYKrhQAxLSW0BXYWfDw6+V5Xsdd6kXM=
X-Google-Smtp-Source: AA+uWPwE9XoWtDyIxDgSJ44hc1hmkmd54WiYHhVhYrDuROQ1fA12pauV31JRY4cx6TOxdXXROC84DrB9O2Uz3BdMBCc=
X-Received: by 2002:a2e:2d2:: with SMTP id
	y79-v6mr30710610lje.100.1534779402411; 
	Mon, 20 Aug 2018 08:36:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:8688:0:0:0:0:0 with HTTP; Mon, 20 Aug 2018 08:36:41
	-0700 (PDT)
In-Reply-To: <1534538608-15231-1-git-send-email-mark.asselstine@windriver.com>
References: <1534538608-15231-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 20 Aug 2018 11:36:41 -0400
Message-ID: <CADkTA4OLpqcPCvp_uvcUhsrL=8jnciY7aGFOhgfwu7wfAVF5Lg@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 1/2] libvirt: fixup ptest to prevent attempts to build tests on the target
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
X-List-Received-Date: Mon, 20 Aug 2018 15:36:44 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Aug 17, 2018 at 4:43 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> Oddly something seems to have changed since I did the uprev of libvirt
> to v4.3.0. Previously using the 'run-ptests' script would only run the
> tests and not attempt to build them first. In preparation for the
> uprev to v4.5.0 I attempted to run the tests and found that they would
> fail to run and instead the tests were attempting to be built. I
> suspect this change is caused by an uprev of autotools and the
> handling of the 'TESTS' built-in.
>
> To prevent this we are explicitly using the '--with-test-suite'
> configure option and this return the previously observed behavior,
> where the tests are simply run and not built.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_4.3.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-extended/libvirt/libvirt_4.3.0.bb b/recipes-extended/libvirt/libvirt_4.3.0.bb
> index 194f049..bb4a256 100644
> --- a/recipes-extended/libvirt/libvirt_4.3.0.bb
> +++ b/recipes-extended/libvirt/libvirt_4.3.0.bb
> @@ -290,6 +290,7 @@ do_install_append() {
>
>  EXTRA_OECONF += " \
>      --with-init-script=systemd \
> +    --with-test-suite \
>      "
>
>  EXTRA_OEMAKE = "BUILD_DIR=${B} DEST_DIR=${D}${PTEST_PATH} PTEST_DIR=${PTEST_PATH} SYSTEMD_UNIT_DIR=${systemd_system_unitdir}"
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

