Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 96932E010F3; Fri,  6 Jul 2018 19:33:54 -0700 (PDT)
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
	*      [209.85.215.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 10AF8E0084E
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Jul 2018 19:33:50 -0700 (PDT)
Received: by mail-lf0-f66.google.com with SMTP id g6-v6so509126lfb.11
	for <meta-virtualization@yoctoproject.org>;
	Fri, 06 Jul 2018 19:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lb3WBR+2jfsTPrikrgIqRBgR8wHpWJo0K1UgGuVA/Ec=;
	b=cosDrsA094qOgvN7IKKHrzvGcoVcjw+8YNd8T7wJpgqzSBl/qhNq8mxmwDTrkQnw0/
	pecfOz+QyuYztxRE6pH/3aZGjBLEJOhmjMv4oXFKFOvLtyeMKIuKeg+9wxtAZMWTMCXz
	M74EywKA58GjjD50UA7YoHUGpxccRzq4PPyufTm092XzYTtJHVs+8XtKyfeG97z7Hfbq
	YnTBAP+Z5Xg8ecIQArseODspjOIwqx8BIsZtl++v80xfIULS8h+25mxq3cA8nnLOVuRo
	JEU1eys3jWpHR1XzjzxzmoAaL+Pxl4UbYv9Clz5fXTLI2/ZlLtAOh1foHe3GoGppXjuK
	Ek9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lb3WBR+2jfsTPrikrgIqRBgR8wHpWJo0K1UgGuVA/Ec=;
	b=TnyGC3bWh/PpakUa6FkwohS226HlLy4tuQwPRUgsxgz6vSDoVHdJA+XquvYPRA77TZ
	VIsKxsA9zNOgBzaQtyDbwi3pTfFO0Ji0tjeKP4IU5S78VIrHiDFP4qRM2iB1pvEtuc3I
	OY3KGGPvxZlbdXynGrEPq8T5FPFj7kZPPB5iwdutewHpJIlW2OSo4nBGgX5GuZA7ENji
	oeOp48/Ix0idL1hSr/Uhy9KKdLpU9jOTnUzuQ50B77++oMyu+O0Vlz8PzYaw7zjb4zAI
	78nUqAOoGEQ01fF1fM7u+ezzxm/000buZ6LmN+X3UoiyMVlET9n9mU5Oj6EaUu7manzv
	KYNw==
X-Gm-Message-State: APt69E1O5yN2S/m5w0M3ijt7U9hFRk/UtFbse35ptd4uK2vzQWfoqFKG
	rNc7O2KJ3tSgt3x3Cl750Q334USbn6LS/f/4fohYQA==
X-Google-Smtp-Source: AAOMgpe/YZWQZawJTTJF+PXkmoleY+I67C5rcfB9urXi7p3JG0Sm+EAQAJCCS0NMpiWB6R1eC+efptraMS+wYUVeQRc=
X-Received: by 2002:a19:ca09:: with SMTP id
	a9-v6mr8421657lfg.142.1530930830052; 
	Fri, 06 Jul 2018 19:33:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP;
	Fri, 6 Jul 2018 19:33:49 -0700 (PDT)
In-Reply-To: <20180706212320.6023-1-jpuhlman@mvista.com>
References: <20180706212320.6023-1-jpuhlman@mvista.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 6 Jul 2018 22:33:49 -0400
Message-ID: <CADkTA4Mp-8+d64xKwzungUpN9cHZAKS1=m-uo-5DqR=SzPkmJg@mail.gmail.com>
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH 1/2] libbsd: Remove dangling append that no longer is needed
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
X-List-Received-Date: Sat, 07 Jul 2018 02:33:54 -0000
Content-Type: text/plain; charset="UTF-8"

Can we log why it is no longer necessary ? i.e. which version of the
package has fixed
the old clean -> rebuild problem.

Bruce

On Fri, Jul 6, 2018 at 5:23 PM, Jeremy Puhlman <jpuhlman@mvista.com> wrote:
> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> ---
>  meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend | 1 -
>  1 file changed, 1 deletion(-)
>  delete mode 100644 meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend
>
> diff --git a/meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend b/meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend
> deleted file mode 100644
> index 7447c56..0000000
> --- a/meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend
> +++ /dev/null
> @@ -1 +0,0 @@
> -inherit autotools-brokensep
> --
> 2.11.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

