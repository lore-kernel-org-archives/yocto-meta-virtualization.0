Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF72FE017BD
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 Oct 2013 21:00:02 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9V3xxKZ000623
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 Oct 2013 20:59:59 -0700 (PDT)
Received: from bruce-ashfields-macbook.local (128.224.20.154) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Wed, 30 Oct 2013 20:59:58 -0700
Message-ID: <5271D5BE.5010409@windriver.com>
Date: Wed, 30 Oct 2013 23:59:58 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Mark Asselstine <asselsm@gmail.com>, <meta-virtualization@yoctoproject.org>
References: <1383184512-28442-1-git-send-email-asselsm@gmail.com>
In-Reply-To: <1383184512-28442-1-git-send-email-asselsm@gmail.com>
Subject: Re: [PATCH] libvirt: add PACKAGECONFIG for sasl
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
X-List-Received-Date: Thu, 31 Oct 2013 04:00:04 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-10-30 9:55 PM, Mark Asselstine wrote:
> We don't want to leave build order dictating whether or not we get
> sasl support in libvirt so add a PACKAGECONFIG for sasl. I have not
> added sasl as a default PACKAGECONFIG since out of the box you would
> not normally get sasl being built so this mimics this behavior. I have
> listed a RDEPENDS in the PACKAGECONFIG as older Yocto builds for some
> reason are not picking up the required runtime dependency.

This makes sense to me. I queued the patch, and if no one objects, I
can push it tomorrow.

Bruce

>
> Signed-off-by: Mark Asselstine <asselsm@gmail.com>
> ---
>   recipes-extended/libvirt/libvirt_1.1.2.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.1.2.bb b/recipes-extended/libvirt/libvirt_1.1.2.bb
> index 56d6aed..4bdade8 100644
> --- a/recipes-extended/libvirt/libvirt_1.1.2.bb
> +++ b/recipes-extended/libvirt/libvirt_1.1.2.bb
> @@ -149,6 +149,7 @@ PACKAGECONFIG[udev] = "--with-udev --with-pciaccess,--without-udev,udev libpciac
>   PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux,"
>   PACKAGECONFIG[ebtables] = "ac_cv_path_EBTABLES_PATH=/sbin/ebtables,ac_cv_path_EBTABLES_PATH=,ebtables,ebtables"
>   PACKAGECONFIG[python] = "--with-python,--without-python,python,"
> +PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl,cyrus-sasl"
>
>   # Enable the Python tool support
>   require libvirt-python.inc
>


