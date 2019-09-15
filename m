Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9F532E009D4; Sat, 14 Sep 2019 20:52:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, FSL_HELO_FAKE,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000] *  1.7 FSL_HELO_FAKE FSL_HELO_FAKE
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.166.47 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
	[209.85.166.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01E37E00C11
	for <meta-virtualization@yoctoproject.org>;
	Sat, 14 Sep 2019 20:52:51 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id f4so70550493ion.2
	for <meta-virtualization@yoctoproject.org>;
	Sat, 14 Sep 2019 20:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=vQh2xe+ukejQDzL1YCiDAqRfSo8vRf9ORZNJZxqb4Oo=;
	b=ttuJjM+OYPmoTJIc/wfr+6b12j2VCYLgJ+ij1FX9SDNav9HEdiJYv0gpXnL1DSpKg0
	WJqOYPgI71YP7a2Ra6fOzXRZF2c6KT9QYMVAiAyDmaadgRlbZRK12IqxbOvcbly46pcZ
	9FS8RFKooKP2lIVyr0n9tHpn8eE1MFLTM5xjoYIcc7SgZKxB0XVHDXlZoZam4PKqmu5g
	dqs81N81yHuLWSjMXXH/FHiRAb/EFis+Miazu9JYqWcPVUWLtHMFqOAR9mQZ1agZgwF0
	ojNWcRhSzr8/NFd+yyYLkCIy5sPxDDoyVRSxXAAgtgqwOzleGvW3AGiVIy0ZFk/myLcy
	Fyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=vQh2xe+ukejQDzL1YCiDAqRfSo8vRf9ORZNJZxqb4Oo=;
	b=WKtxXQJpw5Myho9umdehdN9T9eOFtSIUVJMynweQF9JWKHm6K/5rWP19EsimWt01TV
	fXwCCiG2M/gcOPKdNhBoEpXVBHWkHXUq5hebpjMrh3ew53p9tlD0KSazhPvCN8Lhrjld
	3Ez92aKFk1FogwJbF7l+2fO9TNwrltGL7LSjMbs1OC8ONPIme6tH9HMF4Iz3AM7dXjQz
	aSuqQTwldcbEdCFKzaXJEhazMLyFc5YTjPk5PSKRlewPLiIpsMmI/IdfDIrkTWrtN2NS
	JpvQ7pMERTa4i3bKjdURVOCsXC5v0x5nCC07uLdejoE6xUX7JDNJdIIxc6P45p5yMAlx
	crkA==
X-Gm-Message-State: APjAAAVrkpK5nWtyg0DPWzVV+BSiGjgb4P9Xnz3FeIl5qF3HlUsXOVkc
	vhmjjTe1ImXSw0VpBvvQvR4XOXyq7sg=
X-Google-Smtp-Source: APXvYqz4hqe4ZD9kSeKMcn+bagTeH30IV2zbfGEgK9w+gh/DYWsQWgman5ULP6ZBp7NVXeVgxmRQxg==
X-Received: by 2002:a5d:8350:: with SMTP id q16mr9724098ior.45.1568519571174; 
	Sat, 14 Sep 2019 20:52:51 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	z8sm27240379ioh.62.2019.09.14.20.52.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 14 Sep 2019 20:52:50 -0700 (PDT)
Date: Sat, 14 Sep 2019 23:52:48 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Yunguo Wei <yunguo.wei@windriver.com>
Message-ID: <20190915035247.GB3928@gmail.com>
References: <1568277115-115334-1-git-send-email-yunguo.wei@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1568277115-115334-1-git-send-email-yunguo.wei@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] lxc: restore the ability to move nl80211 device
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
X-List-Received-Date: Sun, 15 Sep 2019 03:52:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] lxc: restore the ability to move nl80211 device
on 12/09/2019 Yunguo Wei wrote:

> nl80211 device can't be moved to another namespace due to
> e389f2afd8509(start: unify and simplify network creation), and lxc
> community has fixed this issue with:
> 
> commit 3dd7829433f63b2ec1323a1f237efa7d67ea6e2b lxc upstream
> 
> This patch is grabbing the commit above, and should be abandoned with
> lxc uprev afterwards.
> 
> See more details here: https://github.com/lxc/lxc/issues/3105
> 
> Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
> ---
>  ...k-restore-ability-to-move-nl80211-devices.patch | 94 ++++++++++++++++++++++
>  recipes-containers/lxc/lxc_3.2.1.bb                |  1 +
>  2 files changed, 95 insertions(+)
>  create mode 100644 recipes-containers/lxc/files/network-restore-ability-to-move-nl80211-devices.patch
> 
> diff --git a/recipes-containers/lxc/files/network-restore-ability-to-move-nl80211-devices.patch b/recipes-containers/lxc/files/network-restore-ability-to-move-nl80211-devices.patch
> new file mode 100644
> index 0000000..aa1aecd
> --- /dev/null
> +++ b/recipes-containers/lxc/files/network-restore-ability-to-move-nl80211-devices.patch
> @@ -0,0 +1,94 @@
> +From 3dd7829433f63b2ec1323a1f237efa7d67ea6e2b Mon Sep 17 00:00:00 2001
> +From: Christian Brauner <christian.brauner@ubuntu.com>
> +Date: Fri, 26 Jul 2019 08:20:02 +0200
> +Subject: [PATCH] network: restore ability to move nl80211 devices
> +
> +Closes #3105.
> +Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
> +---
> + src/lxc/network.c | 31 +++++++++++++++++--------------
> + 1 file changed, 17 insertions(+), 14 deletions(-)
> +
> +diff --git a/src/lxc/network.c b/src/lxc/network.c
> +index 9755116..7684f95 100644
> +--- a/src/lxc/network.c
> ++++ b/src/lxc/network.c
> +@@ -1248,22 +1248,21 @@ static int lxc_netdev_rename_by_name_in_netns(pid_t pid, const char *old,
> + static int lxc_netdev_move_wlan(char *physname, const char *ifname, pid_t pid,
> + 				const char *newname)
> + {
> +-	char *cmd;
> ++	__do_free char *cmd = NULL;
> + 	pid_t fpid;
> +-	int err = -1;
> + 
> + 	/* Move phyN into the container.  TODO - do this using netlink.
> + 	 * However, IIUC this involves a bit more complicated work to talk to
> + 	 * the 80211 module, so for now just call out to iw.
> + 	 */
> + 	cmd = on_path("iw", NULL);
> +-	if (!cmd)
> +-		goto out1;
> +-	free(cmd);
> ++	if (!cmd) {
> ++		return -1;
> ++	}
> + 
> + 	fpid = fork();
> + 	if (fpid < 0)
> +-		goto out1;
> ++		return -1;
> + 
> + 	if (fpid == 0) {
> + 		char pidstr[30];
> +@@ -1274,21 +1273,18 @@ static int lxc_netdev_move_wlan(char *physname, const char *ifname, pid_t pid,
> + 	}
> + 
> + 	if (wait_for_pid(fpid))
> +-		goto out1;
> ++		return -1;
> + 
> +-	err = 0;
> + 	if (newname)
> +-		err = lxc_netdev_rename_by_name_in_netns(pid, ifname, newname);
> ++		return lxc_netdev_rename_by_name_in_netns(pid, ifname, newname);
> + 
> +-out1:
> +-	free(physname);
> +-	return err;
> ++	return 0;
> + }
> + 
> + int lxc_netdev_move_by_name(const char *ifname, pid_t pid, const char* newname)
> + {
> ++	__do_free char *physname = NULL;
> + 	int index;
> +-	char *physname;
> + 
> + 	if (!ifname)
> + 		return -EINVAL;
> +@@ -3279,13 +3275,20 @@ int lxc_network_move_created_netdev_priv(struct lxc_handler *handler)
> + 		return 0;
> + 
> + 	lxc_list_for_each(iterator, network) {
> ++		__do_free char *physname = NULL;
> + 		int ret;
> + 		struct lxc_netdev *netdev = iterator->elem;
> + 
> + 		if (!netdev->ifindex)
> + 			continue;
> + 
> +-		ret = lxc_netdev_move_by_index(netdev->ifindex, pid, NULL);
> ++		if (netdev->type == LXC_NET_PHYS)
> ++			physname = is_wlan(netdev->link);
> ++
> ++		if (physname)
> ++			ret = lxc_netdev_move_wlan(physname, netdev->link, pid, NULL);
> ++		else
> ++			ret = lxc_netdev_move_by_index(netdev->ifindex, pid, NULL);
> + 		if (ret) {
> + 			errno = -ret;
> + 			SYSERROR("Failed to move network device \"%s\" with ifindex %d to network namespace %d",
> +-- 
> +2.7.4
> +
> diff --git a/recipes-containers/lxc/lxc_3.2.1.bb b/recipes-containers/lxc/lxc_3.2.1.bb
> index 585ab8f..4b8f10b 100644
> --- a/recipes-containers/lxc/lxc_3.2.1.bb
> +++ b/recipes-containers/lxc/lxc_3.2.1.bb
> @@ -43,6 +43,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>  	file://template-make-busybox-template-compatible-with-core-.patch \
>  	file://tests-our-init-is-not-busybox.patch \
>  	file://tests-add-no-validate-when-using-download-template.patch \
> +	file://network-restore-ability-to-move-nl80211-devices.patch \
>  	file://dnsmasq.conf \
>  	file://lxc-net \
>  	"
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

