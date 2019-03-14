Return-Path: <Dengke.Du@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 34E6DE00D14; Wed, 13 Mar 2019 17:12:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A50E5E00D11
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 Mar 2019 17:12:22 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2E0C1xV019534
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 Mar 2019 17:12:11 -0700
Received: from [128.224.162.184] (128.224.162.184) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Wed, 13 Mar 2019 17:11:50 -0700
To: <meta-virtualization@yoctoproject.org>
References: <1551927535-18666-1-git-send-email-dengke.du@windriver.com>
From: ddu <dengke.du@windriver.com>
Message-ID: <19ea4f51-91c8-21ff-b972-c7d36ec4e04f@windriver.com>
Date: Thu, 14 Mar 2019 08:11:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <1551927535-18666-1-git-send-email-dengke.du@windriver.com>
X-Originating-IP: [128.224.162.184]
Subject: Re: [m-c-s][PATCH] libvirt: fix GROUPADD_PARAM override conflict
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
X-List-Received-Date: Thu, 14 Mar 2019 00:12:23 -0000
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Ping.

ÔÚ 2019/3/7 ÉÏÎç10:58, Dengke Du Ð´µÀ:
> The libvirt recipe in meta-virtualization already define the GROUPADD_PARAM,
> so we should append it, not override.
>
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>   meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend b/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
> index b55f9a9..0b0f011 100644
> --- a/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
> +++ b/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
> @@ -5,7 +5,7 @@ PACKAGECONFIG ?= "qemu lxc test remote macvtap libvirtd udev yajl \
>   
>   inherit useradd
>   USERADD_PACKAGES = "${PN}"
> -GROUPADD_PARAM_${PN} = "--system libvirt"
> +GROUPADD_PARAM_${PN}_append = " ;--system libvirt"
>   
>   do_install_append() {
>   	sed -e "s:^#unix_sock_group =:unix_sock_group =:g" -i ${D}/etc/libvirt/libvirtd.conf

