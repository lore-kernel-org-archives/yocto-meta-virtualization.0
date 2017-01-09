Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A4650E006D8; Mon,  9 Jan 2017 09:24:18 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4E0C1E0097D
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Jan 2017 09:24:15 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v09HOFgx018559
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 9 Jan 2017 09:24:15 -0800 (PST)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 9 Jan 2017 09:24:14 -0800
To: Mark Asselstine <mark.asselstine@windriver.com>
References: <1483974301-17966-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <31270339-5d91-37e8-fcc6-6c6bd7f973c4@windriver.com>
Date: Mon, 9 Jan 2017 12:24:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <1483974301-17966-1-git-send-email-mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [mcs][PATCH] uwsgi: uprev to the latest
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
X-List-Received-Date: Mon, 09 Jan 2017 17:24:18 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-01-09 10:05 AM, Mark Asselstine wrote:
> The current version fails to build with the latest gcc, additionally
> apache2 in meta-oe has been updated so we should use the latest to
> match.

merged

Bruce

>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  meta-openstack/recipes-extended/uwsgi/uwsgi_git.bb | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/meta-openstack/recipes-extended/uwsgi/uwsgi_git.bb b/meta-openstack/recipes-extended/uwsgi/uwsgi_git.bb
> index b03ca3e..dae288a 100644
> --- a/meta-openstack/recipes-extended/uwsgi/uwsgi_git.bb
> +++ b/meta-openstack/recipes-extended/uwsgi/uwsgi_git.bb
> @@ -4,14 +4,12 @@ SECTION = "net"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=33ab1ce13e2312dddfad07f97f66321f"
>
> -PR = "r0"
> -
>  SRCNAME = "uwsgi"
> -SRC_URI = "git://github.com/unbit/uwsgi.git;branch=master \
> +SRC_URI = "git://github.com/unbit/uwsgi.git;branch=uwsgi-2.0 \
>  "
>
> -SRCREV="7604c6701809602804e3961f7fdb201049b8c993"
> -PV="2.0.4+git${SRCPV}"
> +SRCREV="af44211739136e22471a2897383f34586284bf86"
> +PV="2.0.14+git${SRCPV}"
>  S = "${WORKDIR}/git"
>
>  inherit setuptools pkgconfig
>


