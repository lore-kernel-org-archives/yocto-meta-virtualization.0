Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5D98CE00A51; Thu,  9 Feb 2017 06:16:02 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D50D9E00A3B
	for <meta-virtualization@yoctoproject.org>;
	Thu,  9 Feb 2017 06:15:59 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v19EFtoA027968
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 9 Feb 2017 06:15:55 -0800 (PST)
Received: from [128.224.56.214] (128.224.56.214) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Feb 2017 06:15:54 -0800
To: Mark Asselstine <mark.asselstine@windriver.com>
References: <1486576408-24433-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <b7e4db56-9375-5c35-7232-cf7bb1958edd@windriver.com>
Date: Thu, 9 Feb 2017 09:15:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1486576408-24433-1-git-send-email-mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 1/3] go-native: rename to go-initial-native
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
X-List-Received-Date: Thu, 09 Feb 2017 14:16:02 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

I've merged the 3 patches in this series.

Bruce

On 2017-02-08 12:53 PM, Mark Asselstine wrote:
> With the new per recipe sysroots we were having build issues since the
> bootstrap version of go (go-native 1.4) was being found and not the
> go-cross (1.6) we are expecting. This results in errors such as the
> following when building packages such as containerd:
>
>   _cgo_.o: decoding dwarf section info at offset 0x4: unsupported version 0
>
> This is caused by the dependency tree built up to prepare the per
> recipe sysroot. Since recipes like containerd DEPEND on go-cross and
> go-cross DEPENDS on go-native both are installed but unlike the old
> global sysroot the dependency parsing order results in go-native being
> last, overwriting go-cross. You can see this by running a devshell for
> containerd and running 'go version'.
>
> By adding '-initial' in the name we exploit functionality in
> sstate.bbclass that is already in place to handle gcc-initial and
> similar. This results in only explicit DEPENDS on go-native being
> enforced, so in the case of containerd we only get a dependency on
> go-cross and we therefor get go 1.6 as expected.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-devtools/go-cross/go-cross.inc                                | 4 +++-
>  .../go-cross/{go-native_1.4.bb => go-initial-native_1.4.bb}           | 0
>  2 files changed, 3 insertions(+), 1 deletion(-)
>  rename recipes-devtools/go-cross/{go-native_1.4.bb => go-initial-native_1.4.bb} (100%)
>
> diff --git a/recipes-devtools/go-cross/go-cross.inc b/recipes-devtools/go-cross/go-cross.inc
> index 7f74903..857fbd5 100644
> --- a/recipes-devtools/go-cross/go-cross.inc
> +++ b/recipes-devtools/go-cross/go-cross.inc
> @@ -1,7 +1,9 @@
>  inherit cross
>
>  # libgcc is required for the target specific libraries to build properly
> -DEPENDS += "go-native libgcc virtual/${TARGET_PREFIX}gcc"
> +DEPENDS += "go-initial-native libgcc virtual/${TARGET_PREFIX}gcc"
> +
> +do_compile[depends] += "go-initial-native:do_populate_sysroot"
>
>  # Prevent runstrip from running because you get errors when the host arch != target arch
>  #INHIBIT_PACKAGE_STRIP = "1"
> diff --git a/recipes-devtools/go-cross/go-native_1.4.bb b/recipes-devtools/go-cross/go-initial-native_1.4.bb
> similarity index 100%
> rename from recipes-devtools/go-cross/go-native_1.4.bb
> rename to recipes-devtools/go-cross/go-initial-native_1.4.bb
>


