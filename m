Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 76F9BE00DAE; Tue, 30 Jan 2018 14:12:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5531EE005A2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Jan 2018 14:12:03 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w0UMC27c027965
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Jan 2018 14:12:02 -0800 (PST)
Received: from server.local (128.224.23.36) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 30 Jan 2018 14:12:02 -0800
To: Fabio Berton <fabio.berton@ossystems.com.br>,
	<meta-virtualization@yoctoproject.org>
References: <20180130180220.10190-1-fabio.berton@ossystems.com.br>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <c6cbce5e-1c74-cb13-c9f9-b96e8d3c2e6f@windriver.com>
Date: Tue, 30 Jan 2018 17:12:01 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180130180220.10190-1-fabio.berton@ossystems.com.br>
Subject: Re: [krogoth][PATCH] docker: override GOROOT at build time
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
X-List-Received-Date: Tue, 30 Jan 2018 22:12:05 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2018-01-30 1:02 PM, Fabio Berton wrote:
> From: Yunguo Wei <yunguo.wei@windriver.com>
> 
> Usually $GOROOT is set by go tool, but if sstate is specified, $GOROOT
> is set to the path in the first project. If docker is built in the
> another project(with same SSTATE_DIR) later, and the first project is removed,
> the following error will be seen:
> 
> | go: cannot find GOROOT directory:
> /path/to/previous/project/bitbake_build/tmp/sysroots/x86_64-linux/usr/lib/x86_64-wrs-linux/go
> 
> This commit is overriding $GOROOT stored in the go tool in sstate cache,
> making sure it is set to the correct path in current project.
> 
> See more information here: https://golang.org/doc/install#install
> 

merged to krogoth

Bruce

> Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> (cherry picked from commit 01aa8f18196d76d4554649c47348fb68277574c5)
> ---
>   recipes-containers/docker/docker_git.bb | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
> index 42a336e..898957b 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -80,6 +80,7 @@ do_compile() {
>   	mkdir -p .gopath/src/"$(dirname "${DOCKER_PKG}")"
>   	ln -sf ../../../.. .gopath/src/"${DOCKER_PKG}"
>   	export GOPATH="${S}/.gopath:${S}/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
> +	export GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
>   	cd -
>   
>   	# Pass the needed cflags/ldflags so that cgo
> 


