Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C1284E00D94; Thu, 28 Dec 2017 08:16:04 -0800 (PST)
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
	*      [209.85.216.169 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7313CE00D7B
	for <meta-virtualization@yoctoproject.org>;
	Thu, 28 Dec 2017 08:16:03 -0800 (PST)
Received: by mail-qt0-f169.google.com with SMTP id i40so51600056qti.8
	for <meta-virtualization@yoctoproject.org>;
	Thu, 28 Dec 2017 08:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4YTxcvWLR/MlRb9YuLzcPEuFOXbU2SqGWmL9/kEE1QA=;
	b=gj3/I+BINxLRBl2M8/crHkq7lv2M6HtJ+FjAKyP3QQ9LlZMt2jacO+O+S/49IB91XL
	jMjTvfddeFSDtkOlJ9d10tjvxe0uN5W4C2yyVKZI0meTFzCDRpnTB2akxoWjC9jEW/ZG
	zhUMREVo3Q4McpHy99N+WHyKro3QUV+ofs0ZB260Yo/QR8RGtjkHGn7SDMo1ij16BcUJ
	6EDBRwsxGY+Q3NW+be4nM2orQCFdQ3tqNm/YSo0wsH/O0YwXsHu+e2ORHMqJYOwYYkHQ
	NT6qss6l7d0+HEormmcOZUYVpUdDZR8B2sL5X4nCkiiv1NN/vn5ohcNg/AguYkb6b0bg
	5Sjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4YTxcvWLR/MlRb9YuLzcPEuFOXbU2SqGWmL9/kEE1QA=;
	b=CSGD0Q/olw8QFVzxKcGs5ellyyie9AYlCJ/VXrYFFMENlAhrS08e1hM3g/4pdx30q3
	3bvZl14OrHGtwHgfsWfjYIqWiuK9YC+uf9CetRhexVpMawKOgVphig91vDiu2dJKRzjW
	TjrpiTeVArekL95YJ9pP51JAOxHZ4mHJW7Lj6YUTBynFMJfASp8QH8LWVxT2QaJjXSc+
	aMGzp/a73hF+exz5iLlrLKG+ez0WP5Dw235tj4/adMG6hfangrgcoP7vqmoudoYKOylt
	Ee+NXfZ3g2hHPis35kpGjrRTQd5ZQwkBHshHB9ePRfxf3w4fzlMP2YvP7sHs2yqu6/4l
	Bo/w==
X-Gm-Message-State: AKGB3mKJ2HgWusUM6J+Ls81kO87Z97ct57ZM6SkcY3D5eZ0EysUXhDQQ
	RExsS6au8d+mXsP3aziJQNd424Sdtvp4VU2vuTE=
X-Google-Smtp-Source: ACJfBosl4V7vQkkqsEjKYbbobCwbcx02M9d5m+B4LbZgmdhhBWCTqBLRO4OMDWh/NmT2jNET+hEygYP3DNDTG1ZtAuY=
X-Received: by 10.237.62.67 with SMTP id m3mr44312613qtf.289.1514477762380;
	Thu, 28 Dec 2017 08:16:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Thu, 28 Dec 2017 08:16:01 -0800 (PST)
In-Reply-To: <1513742555-7870-1-git-send-email-mark.asselstine@windriver.com>
References: <1513742555-7870-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 28 Dec 2017 12:16:01 -0400
Message-ID: <CADkTA4OyrPuXTNOrEuG952HhCBXCzoe5p4Aq3pHJw0m5yWE3RQ@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python3-websocket-client: make py2 version available
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
X-List-Received-Date: Thu, 28 Dec 2017 16:16:04 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, Dec 20, 2017 at 12:02 AM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> Allow a py2 version of the python-websocket-client package to be
> built. This is required to support updates in meta-cloud-services.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-devtools/python/python-websocket-client.inc        | 11 +++++++++++
>  recipes-devtools/python/python-websocket-client_0.44.0.bb  |  2 ++
>  recipes-devtools/python/python3-websocket-client_0.44.0.bb | 13 ++-----------
>  3 files changed, 15 insertions(+), 11 deletions(-)
>  create mode 100644 recipes-devtools/python/python-websocket-client.inc
>  create mode 100644 recipes-devtools/python/python-websocket-client_0.44.0.bb
>
> diff --git a/recipes-devtools/python/python-websocket-client.inc b/recipes-devtools/python/python-websocket-client.inc
> new file mode 100644
> index 0000000..31778c6
> --- /dev/null
> +++ b/recipes-devtools/python/python-websocket-client.inc
> @@ -0,0 +1,11 @@
> +SUMMARY = "WebSocket client for python. hybi13 is supported."
> +HOMEPAGE = "https://github.com/websocket-client/websocket-client.git"
> +LICENSE = "LGPL-3.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=18b09a20dd186af4fd60f1a08311628c"
> +
> +inherit pypi
> +
> +PYPI_PACKAGE = "websocket_client"
> +
> +SRC_URI[md5sum] = "73d87aa16a2212da448b30aca9c5bf3b"
> +SRC_URI[sha256sum] = "15f585566e2ea7459136a632b9785aa081093064391878a448c382415e948d72"
> diff --git a/recipes-devtools/python/python-websocket-client_0.44.0.bb b/recipes-devtools/python/python-websocket-client_0.44.0.bb
> new file mode 100644
> index 0000000..11eeb04
> --- /dev/null
> +++ b/recipes-devtools/python/python-websocket-client_0.44.0.bb
> @@ -0,0 +1,2 @@
> +require python-websocket-client.inc
> +inherit setuptools
> \ No newline at end of file
> diff --git a/recipes-devtools/python/python3-websocket-client_0.44.0.bb b/recipes-devtools/python/python3-websocket-client_0.44.0.bb
> index 8dfc95f..473e31f 100644
> --- a/recipes-devtools/python/python3-websocket-client_0.44.0.bb
> +++ b/recipes-devtools/python/python3-websocket-client_0.44.0.bb
> @@ -1,11 +1,2 @@
> -SUMMARY = "WebSocket client for python. hybi13 is supported."
> -HOMEPAGE = "https://github.com/websocket-client/websocket-client.git"
> -LICENSE = "LGPL-3.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=18b09a20dd186af4fd60f1a08311628c"
> -
> -inherit pypi setuptools3
> -
> -PYPI_PACKAGE = "websocket_client"
> -
> -SRC_URI[md5sum] = "73d87aa16a2212da448b30aca9c5bf3b"
> -SRC_URI[sha256sum] = "15f585566e2ea7459136a632b9785aa081093064391878a448c382415e948d72"
> +require python-websocket-client.inc
> +inherit setuptools3
> \ No newline at end of file
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

