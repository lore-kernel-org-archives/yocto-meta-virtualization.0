Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 59B5BE00B9D; Thu, 25 Oct 2018 03:34:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.167.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 957A3E00AE0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Oct 2018 03:34:26 -0700 (PDT)
Received: by mail-lf1-f67.google.com with SMTP id n3-v6so6374152lfe.7
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Oct 2018 03:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CHsoSl3g2A4E0ySE8MJQ9k2irh37W/GNqzY+LGq1VRc=;
	b=lsot+gX++6Bd3pCkZxtghhnFjjmllhe/6e8bykdWvZxdhu1wAvwJ1yXqhmnCOXjQf8
	gDZ6yTmb6fxSe4wNSYwJQlqIJ27q7lip6nFfhTbDJQJlzvoHhbRqWW4IL5m7Up7cmYy4
	erjPRJyrnKf+L/AZVPkDACQtrktYIXtsQXGnWfXSTmf6y+BiQG6BIN8XHwN8+U4mO8vL
	USFah24c9K/fC79cHvk+iJiIFSiZMUBOufK0s5pptMEoy65ILYhevYp81QogDPnvgYkg
	HmARlZ63X26jtaK8Jj5Uj4UEj4rJKUZIUFf5ZJZ9gefaCO0ubiyjc58qLLhciBGJM68u
	KjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CHsoSl3g2A4E0ySE8MJQ9k2irh37W/GNqzY+LGq1VRc=;
	b=WoCUvop0CdbAe1F4K5cYmt34ubmMbuUJOrifQxIrJ4arF2CWCfczo62jrDeW002RZg
	VZYAIw17IWKOwHCU26fVITJL/uJQlaRTkXIBscfMjhqSmWhwFkmgaSMTIZmTnLfZ3/X5
	vLdWr7h7j0XW0bH0+oRU9c5/BggTF0jDK/RGOygETuIXrGZySkFS4zQc+zV5JHhL3BT8
	zB7juWtrvkUkd2jAU0D81HYi1PtjE6ie27nOX/UCgoAXo5nYJATfuZ+a95JkynrXDMP/
	0WY/zd4UyZdIm3lbeyXGVRaMq+tKOg2bJSGOoscNL6NkSl7vqHbVxEGE/G+HpwZs6GUk
	Mrog==
X-Gm-Message-State: AGRZ1gIOKt27iMnVxoug759LBXhVkoU/Blm4KjNnhAaMvvEf23dWqcq6
	zMT4AjbqGDrKnwLnjUK9OiQdHDCtWJoPSqCT5cY=
X-Google-Smtp-Source: AJdET5dWpF6ivLb+DecV2hggrNxjHmGh1f6JNJfwTDdLSYonCa/rRiKLXR701wABiMYMngasldmjYWlYzuZarIRlvrY=
X-Received: by 2002:a19:1b4d:: with SMTP id b74-v6mr793929lfb.42.1540463665618;
	Thu, 25 Oct 2018 03:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <1540263471-28644-1-git-send-email-mingli.yu@windriver.com>
In-Reply-To: <1540263471-28644-1-git-send-email-mingli.yu@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 25 Oct 2018 06:34:14 -0400
Message-ID: <CADkTA4MTTeN_NJKegXuAKmd20FtR+YSJrTorryuOJitc9CU7KQ@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] glusterfs: Update SRC_URI
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
X-List-Received-Date: Thu, 25 Oct 2018 10:34:27 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce
On Mon, Oct 22, 2018 at 10:58 PM <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> Update SRC_URI for glusterfs as the previous
> one is invalid.
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  recipes-extended/glusterfs/glusterfs_3.11.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/glusterfs/glusterfs_3.11.1.bb b/recipes-extended/glusterfs/glusterfs_3.11.1.bb
> index bbaaaf4..6ca157c 100644
> --- a/recipes-extended/glusterfs/glusterfs_3.11.1.bb
> +++ b/recipes-extended/glusterfs/glusterfs_3.11.1.bb
> @@ -1,4 +1,4 @@
> -SRC_URI = "http://download.gluster.org/pub/gluster/glusterfs/3.11/${PV}/${BPN}-${PV}.tar.gz"
> +SRC_URI = "https://bits.gluster.org/pub/gluster/glusterfs/src/${BPN}-${PV}.tar.gz"
>
>  SRC_URI[md5sum] = "46d56837b8b5c785f2f1e5317d5f6da8"
>  SRC_URI[sha256sum] = "c7e0502631c9bc9da05795b666b74ef40a30a0344f5a2e205e65bd2faefe1442"
> --
> 2.7.4
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

