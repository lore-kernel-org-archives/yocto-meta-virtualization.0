Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6EEDBE00872; Mon, 15 Oct 2018 05:49:59 -0700 (PDT)
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
	*      [209.85.167.66 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE2E9E00718
	for <meta-virtualization@yoctoproject.org>;
	Mon, 15 Oct 2018 05:49:58 -0700 (PDT)
Received: by mail-lf1-f66.google.com with SMTP id o21-v6so13995919lfe.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 15 Oct 2018 05:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+AAHowrg0I9MDDErVe8XBdiXtqycu1jv0bKLn17lAM4=;
	b=lXOPXcNT0MwVsVTznuiOHnPE13PBcxvjUEVpsOtcKl2YQXmXtKbyxHIUvutPNwtFO5
	psUwInjeqs2spkGLnfOKZl0oJfKuCsmRkCh3g5uAJxzvooyEEXkkMOxo0xh4XftZ9rlm
	QE6pgNJtD3ZKYOnisx1hKIIijqA19lOJxpHRtJiYtQwceIlHE3c0DKBLcDu4LZeBPjsP
	LjJoUay+338KEN9TDCtVZ/oyq7hi5B+m5vNsvrQz0eH/LksZJgrcPOv4sj+FY6DLQWua
	w6sbZtBq24Ge+NyFOzjJUTAiz7iylSXbqnWcQ9ZXqQRZ77quVGeqRUbzKVWIO/6Gki4k
	6YQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+AAHowrg0I9MDDErVe8XBdiXtqycu1jv0bKLn17lAM4=;
	b=SmUshNQhdfdN3Jbdk3G0YIuCAgrvTznY7DPR9GgE+s3OB7sGScPgtgyE9qiRm69JDW
	9VjaXLELVPrt60bWyGE/7hZ9oVuDsRBGSHXYB3r9lYUcfj2gslKqF9JSQCkOMs7kwl4O
	nW6Klr9Wv0W7VNlLKYWEoY3EoJHsH/ZJ1CmKU5kN1ScskiqwliZ1RYWjYxV2Yqn3Zr8n
	uJpPkIHheXDQ8CUIpmuZugXviv4OePLQFBKdUnFnsZ8NBpXKXSjKXfs50bI/JuyTIA7c
	AJ1BMz2vJGvOQ2qoZLmijNlkp9My2N9mp/oDcZESe7nw0jWnGjXwdJK7l+O9lyd14i0s
	RJJw==
X-Gm-Message-State: ABuFfohB1sgGfYK/gWRFdJktZxPSLCmwbnUDbbXC5SZCNYzRyDsRi+L9
	ye2eSjkpBjoXFu+MoSG98Mdgaa82QoZ2T06jJkc=
X-Google-Smtp-Source: ACcGV633mgB9Gs5AWl3tKHSAlK8ixcrbfJMLEQ5M5bY6YQKTFmBTs6ZzSGOEiMwIDJhOaimK476ZV9gstO85xEj116E=
X-Received: by 2002:a19:d824:: with SMTP id
	p36-v6mr9508747lfg.23.1539607797540; 
	Mon, 15 Oct 2018 05:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <1539587720-29268-1-git-send-email-Qi.Chen@windriver.com>
In-Reply-To: <1539587720-29268-1-git-send-email-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 15 Oct 2018 08:49:46 -0400
Message-ID: <CADkTA4M=TqJjHG1uped9dOb9JtW545KEXuqH_prWoFCg4xyd0g@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] libvirt: do not defer postinstall to first boot when not necessary
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
X-List-Received-Date: Mon, 15 Oct 2018 12:49:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 15, 2018 at 3:28 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> The postinstall in libvirt has already got a check against $D to
> tell whether it's running on target or not, we do not need to use
> pkg_postinstall_ontarget. Otherwise, we get unnecessary postinstall
> deferred to first boot, which is not what we want.

This commit message isn't complete ...

So when is the postinstall run for the target case ?

Bruce

>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_4.7.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_4.7.0.bb b/recipes-extended/libvirt/libvirt_4.7.0.bb
> index 47275ae..ecccfee 100644
> --- a/recipes-extended/libvirt/libvirt_4.7.0.bb
> +++ b/recipes-extended/libvirt/libvirt_4.7.0.bb
> @@ -311,7 +311,7 @@ do_install_ptest() {
>         done
>  }
>
> -pkg_postinst_ontarget_${PN}() {
> +pkg_postinst_${PN}() {
>          if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
>                  /etc/init.d/populate-volatile.sh update
>          fi
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

