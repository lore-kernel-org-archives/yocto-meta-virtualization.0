Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8D110E00F08; Wed, 14 Mar 2018 05:39:41 -0700 (PDT)
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
	*      [209.85.215.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EECFEE00823
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Mar 2018 05:39:40 -0700 (PDT)
Received: by mail-lf0-f67.google.com with SMTP id p74-v6so4576542lfd.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Mar 2018 05:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pJU1smOc36Qosl2XObYAHgjNoOuwRZsyiIDokClKkVQ=;
	b=AyBAraADuw7zYaJ4qd38e1rrIertZGjq1Y8UhjZFJScxVf/U5ui0wk3/SsLAeX4d+A
	nh00UpptPh2ceyC6bYoxD9/WdY9CSYdkWaxYVZ1R0XUun/eLCaoU2AAol1iyXwU78dPW
	RwITkgmYXFhxq2EnfruImYHmu4lKae7zODo8C+g4oGTfrbv75+Jw+a3j5I7XVeb63FDY
	FSQkVuWgT1t5/1XRb8Yglfyh13IKtW8wtCxCTGLaE2KT2jQUV2JxqyA585KDoTXkvz/x
	h656iNsy0NmQw5FwRSetot2LmTbGVpOqC0NToOqpxpEGAgZ+Ce+TLmz8J+JejMqDTvW9
	2NCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pJU1smOc36Qosl2XObYAHgjNoOuwRZsyiIDokClKkVQ=;
	b=fjCzBwOriQH6i2YppM7H14ynA1PlEmEKlGhzlEy5C4JtsrpK/2mXbZRjptn1IkB0hm
	q+jm/8GdGEFw6BQRHmcGnmdfw46Ry/+mgian2FoGMQj0Xy5gIeIlK/DX5ad9LIIY6qeh
	+xX90rVHBxoKoHuEFmGbqRWIHV9ZhKu3Acx7N+L7D0zVgNwJPVLxzydnb+4g2TKxGDbi
	9LAphll5G/0t6JxIbLf4mED0RxuvrMaKqWIFEZjz7WjguPHZ9Q8FJBf34bOiGvBpf0zh
	tmxi3dTXHbMxb6nkJf8FrWvjR86yLDB0y3kI3+LDVoH5w3kKA/h0ZVGqSDqEYXCJpx6a
	UUYA==
X-Gm-Message-State: AElRT7FgNoq9jrzVGL56dOSCy5v989BEdsHCwgtUIw6U2HBU0X1va++Y
	rjD0amsuG1wv9MEKgTw+x5I4jZNNMzZ9CbaXFVlQow==
X-Google-Smtp-Source: AG47ELubuJ6v4daAsp0bIWoB5Vx3XsAjnJbBjfPYc/Cn+w6JAWhBec4rs9OimeboQbAPKdvKmCfwKRp5hZ564ppXY0k=
X-Received: by 2002:a19:97d0:: with SMTP id
	z199-v6mr3163007lfd.94.1521031179654; 
	Wed, 14 Mar 2018 05:39:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Wed, 14 Mar 2018 05:39:39 -0700 (PDT)
In-Reply-To: <20180314083947.22458-1-pascal.bach@siemens.com>
References: <20180314083947.22458-1-pascal.bach@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 14 Mar 2018 08:39:39 -0400
Message-ID: <CADkTA4O1ze=NKO61dL_C-h99G5Bx49gXrEVrHXDz4+Z6nP7h2w@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] containerd: remove redundant systemd detection
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
X-List-Received-Date: Wed, 14 Mar 2018 12:39:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 14, 2018 at 4:39 AM, Pascal Bach <pascal.bach@siemens.com> wrote:
> The variables only take effect if systemd is enabled so the check can be removed.
>

Same comment.

This layer, and many others, have always had this check since that's
how the systemd
classes worked before.

Can you log the oe-core commit that changes the behaviour in the long
log of the two
cleanup patches ?

Bruce

> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  recipes-containers/containerd/containerd.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/containerd/containerd.inc b/recipes-containers/containerd/containerd.inc
> index f91e018..801ace1 100644
> --- a/recipes-containers/containerd/containerd.inc
> +++ b/recipes-containers/containerd/containerd.inc
> @@ -53,8 +53,8 @@ do_compile() {
>
>  # Note: disabled for now, since docker is launching containerd
>  # inherit systemd
> -# SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
> -# SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('DISTRO_FEATURES','systemd','containerd.service','',d)}"
> +# SYSTEMD_PACKAGES = "${PN}"
> +# SYSTEMD_SERVICE_${PN} = "containerd.service"
>
>  do_install() {
>      mkdir -p ${D}/${bindir}
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

