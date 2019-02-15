Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A6714E00C9F; Fri, 15 Feb 2019 12:13:26 -0800 (PST)
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
	*      [209.85.208.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01DEEE00C43
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Feb 2019 12:13:25 -0800 (PST)
Received: by mail-lj1-f196.google.com with SMTP id v16so9380777ljg.13
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Feb 2019 12:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8ryfCwNyOsxsAMtpMwDsijnXVFlw07db1eEnqzROgHY=;
	b=qy/BPQGaDJw3Q8f6QTMMYDphXvsB2ctaoH+fewsID2nLqglW8Ydht3hEePZTMoL3nV
	6sAn2/RUAJBtJ7Abtb8Mz5DOwNUTE/TyNJUL/zl3rCoGfLoV4GDCGW1fUTzKUdsaHzUc
	2zbNobH8bwCJeuEgmSFrZwiXukwl6Sg7Kn5+WeT7Tz8pJPLkUGiThvQpRafohbrnX/W1
	Hp5xUkmzg82jfnVETJTO4gI+0pDJ2jtvisjmyI23ai0RMSagFNfLApVyfPpGc8huBG0Q
	H6GSNXZYKXWPLQ8+O3r+UhWLmMdRrnqWD/nXIMKv7MqjegMSAZKfZcYCidZ3l+MATFod
	Z5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8ryfCwNyOsxsAMtpMwDsijnXVFlw07db1eEnqzROgHY=;
	b=kZL763O7+dosKwTKYNAHXQC04orAu/1vZAnkIX3Sy3PcjH7LlHx2tXYcuGBAUSK4O1
	QEDWGVupHbfKY7CWisDO/TjAMB6NMfv/PrVsY/EZ+NiMmHWyzqwR3CZGxp+nXNbPhKDl
	3XQN/P1h8ZT7Bcfip2c6xl1u0a6nMfsCh9Xlo2AM+HTurgjWtiScdZMCaiObvK8IcE0x
	OV5BS/9FlcV52Qt8KJWyYbJTzGm/4MptuEIZZa5xqaCz5gGf/pLR/jSZ2vg0QcC1CaZ1
	cw8k+JJY9JFUWudavAgnvyDwCVpkpi/OuINYENErYTcQUiujRRbHFXLbp2yqyPRrstn+
	iQZg==
X-Gm-Message-State: AHQUAubDINzbwGoSTbSBeDRvl+z5ttMmoYRGKeL4yh5si6ZhJ5p3cage
	42E5szLyETlkjEVoCBslOixR3JWs1GnjwMLHWu4=
X-Google-Smtp-Source: AHgI3IY/p3vMQQ8AvlDllBjAlxUXElSA53dNxz1xNrXiy2KaG57AEFsO9b1VZ3Y9l0haPu8md1PorW81W++HSu5MGok=
X-Received: by 2002:a2e:7316:: with SMTP id
	o22-v6mr6691333ljc.82.1550261603847; 
	Fri, 15 Feb 2019 12:13:23 -0800 (PST)
MIME-Version: 1.0
References: <20190215163238.28369-1-stefan@agner.ch>
In-Reply-To: <20190215163238.28369-1-stefan@agner.ch>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 15 Feb 2019 15:13:12 -0500
Message-ID: <CADkTA4Mbh64A4T0RUTwfoYq7w-nimtZOq6CMNpfvbDoZ2tjAnw@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: meta-virtualization@yoctoproject.org,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH v2] runc: address CVE-2019-5736
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
X-List-Received-Date: Fri, 15 Feb 2019 20:13:26 -0000
Content-Type: text/plain; charset="UTF-8"

v2 is merged.

Bruce

On Fri, Feb 15, 2019 at 11:32 AM Stefan Agner <stefan@agner.ch> wrote:
>
> From: Stefan Agner <stefan.agner@toradex.com>
>
> Use git hash which addresses CVE-2019-5736. Use the same git hash
> used in top of Docker 18.09 branch.
>
> Changes in runc since
>   6635b4f0 merge branch 'cve-2019-5736'
>   0a8e4117 nsenter: clone /proc/self/exe to avoid exposing host binary to container
>   dd023c45 merge branch 'pr-1972'
>
> Fixes: CVE-2019-5736
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>  recipes-containers/runc/runc-docker_git.bb         | 2 +-
>  recipes-containers/runc/runc-opencontainers_git.bb | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
> index 41c82f7..4eb2d07 100644
> --- a/recipes-containers/runc/runc-docker_git.bb
> +++ b/recipes-containers/runc/runc-docker_git.bb
> @@ -4,7 +4,7 @@ RRECOMMENDS_${PN} = "lxc docker"
>
>  # Note: this rev is before the required protocol field, update when all components
>  #       have been updated to match.
> -SRCREV_runc-docker = "4a600c04ed480084b2351b3e32c26cb4a2d5d533"
> +SRCREV_runc-docker = "6635b4f0c6af3810594d2770f662f34ddc15b40d"
>  SRC_URI = "git://github.com/opencontainers/runc;nobranch=1;name=runc-docker \
>             file://0001-runc-Add-console-socket-dev-null.patch \
>             file://0001-build-drop-recvtty-and-use-GOBUILDFLAGS.patch \
> diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
> index 27c5f23..5f65940 100644
> --- a/recipes-containers/runc/runc-opencontainers_git.bb
> +++ b/recipes-containers/runc/runc-opencontainers_git.bb
> @@ -1,6 +1,6 @@
>  include runc.inc
>
> -SRCREV = "4a600c04ed480084b2351b3e32c26cb4a2d5d533"
> +SRCREV = "6635b4f0c6af3810594d2770f662f34ddc15b40d"
>  SRC_URI = " \
>      git://github.com/opencontainers/runc;branch=master \
>      "
> --
> 2.13.6
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

