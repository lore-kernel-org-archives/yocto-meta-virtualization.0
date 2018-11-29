Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 73879E00C7E; Thu, 29 Nov 2018 09:08:16 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 49F86E00C71
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Nov 2018 09:08:15 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wATH7ilh018826
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Nov 2018 09:08:04 -0800
Received: from [128.224.56.49] (128.224.56.49) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 29 Nov 2018 09:07:44 -0800
To: Mark Asselstine <mark.asselstine@windriver.com>,
	<meta-virtualization@yoctoproject.org>
References: <1543434585-29236-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <491117f7-1f5f-000b-8238-302205cb9ece@windriver.com>
Date: Thu, 29 Nov 2018 12:07:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1543434585-29236-1-git-send-email-mark.asselstine@windriver.com>
Subject: Re: [PATCH] lxc: uprev from 3.0.2 to 3.0.3
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
X-List-Received-Date: Thu, 29 Nov 2018 17:08:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

merged

Bruce

On 11/28/18 2:49 PM, Mark Asselstine wrote:
> Update to the just released v3.0.3. This release is a collection of
> minor changes, bug fixes, logging updates, documentation cleanup, code
> cleanup and some new tests.
> 
> We have an improved outlook as far as ptests is concerned as well:
>      ### Starting LXC ptest ###
>      FAIL: lxc-test-api-reboot
>      SKIPPED: lxc-test-apparmor
>      PASS: lxc-test-attach
>      PASS: lxc-test-automount
>      FAIL: lxc-test-autostart
>      PASS: lxc-test-basic
>      PASS: lxc-test-cgpath
>      PASS: lxc-test-cloneconfig
>      PASS: lxc-test-clonetest
>      PASS: lxc-test-concurrent
>      PASS: lxc-test-config-jump-table
>      PASS: lxc-test-console
>      PASS: lxc-test-console-log
>      PASS: lxc-test-containertests
>      PASS: lxc-test-createconfig
>      PASS: lxc-test-createtest
>      PASS: lxc-test-criu-check-feature
>      PASS: lxc-test-destroytest
>      PASS: lxc-test-device-add-remove
>      PASS: lxc-test-get_item
>      PASS: lxc-test-getkeys
>      PASS: lxc-test-list
>      PASS: lxc-test-locktests
>      PASS: lxc-test-lxcpath
>      PASS: lxc-test-may-control
>      FAIL: lxc-test-no-new-privs
>      PASS: lxc-test-parse-config-file
>      PASS: lxc-test-raw-clone
>      PASS: lxc-test-reboot
>      PASS: lxc-test-rootfs
>      PASS: lxc-test-saveconfig
>      PASS: lxc-test-share-ns
>      PASS: lxc-test-shortlived
>      SKIPPED: lxc-test-shutdowntest
>      PASS: lxc-test-snapshot
>      PASS: lxc-test-startone
>      SKIPPED: lxc-test-state-server
>      PASS: lxc-test-utils
> 
>      Results:
>          PASSED = 32
>          FAILED = 3
>          SKIPPED = 3
>      (for details check individual test log in ./logs directory)
> 
>      ### LXC ptest complete ###
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>   recipes-containers/lxc/{lxc_3.0.2.bb => lxc_3.0.3.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename recipes-containers/lxc/{lxc_3.0.2.bb => lxc_3.0.3.bb} (97%)
> 
> diff --git a/recipes-containers/lxc/lxc_3.0.2.bb b/recipes-containers/lxc/lxc_3.0.3.bb
> similarity index 97%
> rename from recipes-containers/lxc/lxc_3.0.2.bb
> rename to recipes-containers/lxc/lxc_3.0.3.bb
> index 9bb2866..f3924e4 100644
> --- a/recipes-containers/lxc/lxc_3.0.2.bb
> +++ b/recipes-containers/lxc/lxc_3.0.3.bb
> @@ -48,8 +48,8 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>   	file://lxc-net \
>   	"
>   
> -SRC_URI[md5sum] = "72e2f1e718c7ddf3ffa9b18ec0328d8f"
> -SRC_URI[sha256sum] = "6ab7117b17066220da450c55ed77953998cf2336d415143b879554364af12f5c"
> +SRC_URI[md5sum] = "0aa1a982f7dfa4c7b8ce87b7047b0b6e"
> +SRC_URI[sha256sum] = "620cb832cc02c63bf4d330657bf6176544e145da281ee384a34d689635a19841"
>   
>   S = "${WORKDIR}/${BPN}-${PV}"
>   
> 


