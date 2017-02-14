Return-Path: <jan.kiszka@siemens.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A8A2BE008D0; Tue, 14 Feb 2017 01:49:15 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.35.17.28 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B4ABE0086E
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Feb 2017 01:49:10 -0800 (PST)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v1E9n6vj029668
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Tue, 14 Feb 2017 10:49:06 +0100
Received: from md1f2u6c.ww002.siemens.net (md1d7d7c.ww300.siemens.net
	[139.22.47.104])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v1E9n6LJ026404;
	Tue, 14 Feb 2017 10:49:06 +0100
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <91a2ecd5-1f2d-25c4-ee68-972b8920d67c@siemens.com>
	<CADkTA4NxjSQZi06Dniog3H6U5xPWq+ZP_UeA9Oigxg_L6E-cUA@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <88626e0b-e944-751e-9885-c84b74220bd0@siemens.com>
Date: Tue, 14 Feb 2017 10:49:06 +0100
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <CADkTA4NxjSQZi06Dniog3H6U5xPWq+ZP_UeA9Oigxg_L6E-cUA@mail.gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] containerd: Fix build on 386
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
X-List-Received-Date: Tue, 14 Feb 2017 09:49:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 2017-02-10 22:17, Bruce Ashfield wrote:
> applied.
> 
> Bruce
> 

Thanks. Will it go into stable as well? At least morty.

Jan

> On Fri, Feb 10, 2017 at 7:14 AM, Jan Kiszka <jan.kiszka@siemens.com
> <mailto:jan.kiszka@siemens.com>> wrote:
> 
>     Go only understands "386" as target arch, not "i586". Adjust this.
> 
>     Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com
>     <mailto:jan.kiszka@siemens.com>>
>     ---
> 
>     Found while building meta-virtualization for an Intel Quark target.
> 
>      recipes-containers/containerd/containerd_git.bb
>     <http://containerd_git.bb> | 3 +++
>      1 file changed, 3 insertions(+)
> 
>     diff --git a/recipes-containers/containerd/containerd_git.bb
>     <http://containerd_git.bb>
>     b/recipes-containers/containerd/containerd_git.bb
>     <http://containerd_git.bb>
>     index c257355..5b94dde 100644
>     --- a/recipes-containers/containerd/containerd_git.bb
>     <http://containerd_git.bb>
>     +++ b/recipes-containers/containerd/containerd_git.bb
>     <http://containerd_git.bb>
>     @@ -35,6 +35,9 @@ do_compile() {
>             if [ "${TARGET_ARCH}" = "aarch64" ]; then
>                     export GOARCH="arm64"
>             fi
>     +       if [ "${TARGET_ARCH}" = "i586" ]; then
>     +               export GOARCH="386"
>     +       fi
> 
>             # Set GOPATH. See 'PACKAGERS.md'. Don't rely on
>             # docker to download its dependencies but rather
> 
>     --
>     _______________________________________________
>     meta-virtualization mailing list
>     meta-virtualization@yoctoproject.org
>     <mailto:meta-virtualization@yoctoproject.org>
>     https://lists.yoctoproject.org/listinfo/meta-virtualization
>     <https://lists.yoctoproject.org/listinfo/meta-virtualization>
> 
> 
> 
> 
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"

-- 
Siemens AG, Corporate Technology, CT RDA ITP SES-DE
Corporate Competence Center Embedded Linux

