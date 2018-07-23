Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3252EE00A4C; Sun, 22 Jul 2018 20:21:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.167.42 listed in list.dnswl.org]
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
	[209.85.167.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94047E00874
	for <meta-virtualization@yoctoproject.org>;
	Sun, 22 Jul 2018 20:21:10 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id l16-v6so5335469lfc.13
	for <meta-virtualization@yoctoproject.org>;
	Sun, 22 Jul 2018 20:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UbjoKTBOdQD6NT2/7bdOg4RVvL/ukwxZFgRus6hn2IA=;
	b=Y54AYT4gIQcszHMuhf/rgu/Le2oN77Nh3BT/9ba6C0DJIZ92GylAXo1ifeL7ngSEWh
	7/6L6wVqLqAxDBDV67YAM1UO5e++j84XuO/+fUcE3gaJxhU+TTb95dFP+OfMyaNQhSL2
	vwN3URNCqcqOKeLFXI3GqtDinhEinf1tE+3F6FzfYLSdNotrMDmKUu3NGPYGcmN3Xjsb
	o248wrp+ZJTn1tmIoYDbbCiKBXVxSguMh1ahx18DW7t+XGYpAA75QIvT30C0o6TV0bRS
	uWsmwJGbRm0PaXBl9zFLJOTwyXrZnzQGXpw+PtiKqyLPWXmWDp7o/TrDonGST4GzoLPY
	99Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UbjoKTBOdQD6NT2/7bdOg4RVvL/ukwxZFgRus6hn2IA=;
	b=ledKB2V/pcXfGFtkWpS2BPKtmD6KXJzlSLWhC+lKnTpJI8+a7fPnlqBelZ9yA/e5ob
	J87F1D2f8nt6BxOlXRPqt7Cfwyqo4faaO4yvwwOTjQdgGImm6F+85cXFnYJ/MkR5+ilc
	j91uS/AxGcHivka8xngODF4QZicePhgUHQ/Yh1VZ2uWW+B1U37WhjBl/ZvZc9kwkSPH+
	13kjr5Mer2LSswjIRqsg64BIycmo8vfuuU37mS9PNq9QxYSY1Aknsj3l67Y9H80o1dVB
	hoH/TM2Qb0t8YjegA70iuxBRIKHUVQbUjSyMpF3Cf0AZvYrU/AxF6Zrkvxwj2X+fqZIe
	a/1w==
X-Gm-Message-State: AOUpUlEjbnsyZClBO504wLVIWN/rGEN+2aWhpfwTWKiRXq2UJT7TC7gL
	b/Y5HiCYKMU71bNi5WT2WFd3Rny4pN657cCe7J0=
X-Google-Smtp-Source: AAOMgpcJTxAdZZWvxAfnWzsk2nHVQYIO0+CJ8zaK7rcn0dGCQAlDrbxc9LHHBm3dOGAgzpMmhl8S8N6G4MBl5XBmI+w=
X-Received: by 2002:a19:cb44:: with SMTP id
	b65-v6mr6428987lfg.12.1532316069552; 
	Sun, 22 Jul 2018 20:21:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP; Sun, 22 Jul 2018 20:21:09
	-0700 (PDT)
In-Reply-To: <20180716093631.27024-4-hongl.fnst@cn.fujitsu.com>
References: <20180716093631.27024-1-hongl.fnst@cn.fujitsu.com>
	<20180716093631.27024-4-hongl.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 22 Jul 2018 23:21:09 -0400
Message-ID: <CADkTA4Px8VnJ=84R6RkyZRn7zH2Dbin6tCLKrUy58GG-AFQEqA@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] [meta-cloud-services][patch]:python-kombu:4.1.0 -> 4.2.0
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
X-List-Received-Date: Mon, 23 Jul 2018 03:21:11 -0000
Content-Type: text/plain; charset="UTF-8"

merged

bruce

On Mon, Jul 16, 2018 at 5:36 AM, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
> Upgrade python-kombu from 4.1.0 to 4.2.0.
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-kombu_4.1.0.bb => python-kombu_4.2.0.bb}           | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-kombu_4.1.0.bb => python-kombu_4.2.0.bb} (70%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-kombu_4.1.0.bb b/meta-openstack/recipes-devtools/python/python-kombu_4.2.0.bb
> similarity index 70%
> rename from meta-openstack/recipes-devtools/python/python-kombu_4.1.0.bb
> rename to meta-openstack/recipes-devtools/python/python-kombu_4.2.0.bb
> index 8d44426..47cb5bf 100644
> --- a/meta-openstack/recipes-devtools/python/python-kombu_4.1.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-kombu_4.2.0.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=daea7c168428449fbee05e644df929f4"
>
> -SRC_URI[md5sum] = "2fb2be9fec0e6514231bba23a3779439"
> -SRC_URI[sha256sum] = "4249d9dd9dbf1fcec471d1c2def20653c9310dd1a217272d77e4844f9d5273cb"
> +SRC_URI[md5sum] = "cb7e668936cd5ffc3232b72a2a4f931f"
> +SRC_URI[sha256sum] = "d601c47312833c0f6f4aaf037f293b2627398d4cf8526e6ba0360287294ee1fb"
>
>  inherit setuptools pypi
>
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

