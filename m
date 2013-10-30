Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A6652E017A7
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Oct 2013 20:05:26 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9U35Pie015069
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Oct 2013 20:05:25 -0700 (PDT)
Received: from bruce-ashfields-macbook.local (128.224.19.23) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Tue, 29 Oct 2013 20:05:25 -0700
Message-ID: <52707772.2050001@windriver.com>
Date: Tue, 29 Oct 2013 23:05:22 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:24.0) Gecko/20100101 Thunderbird/24.0.1
MIME-Version: 1.0
To: Paul Barrette <paul.barrette@windriver.com>,
	<meta-virtualization@yoctoproject.org>
References: <1383079227-24408-1-git-send-email-paul.barrette@windriver.com>
In-Reply-To: <1383079227-24408-1-git-send-email-paul.barrette@windriver.com>
Subject: Re: [PATCH] initscripts: add warning and begin functions to lsb_log_message
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
X-List-Received-Date: Wed, 30 Oct 2013 03:05:26 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-10-29 4:40 PM, Paul Barrette wrote:
> Some init scripts call a "begin" or "warning" function to log early init
> phase messages, e.g. openvswitch-controller.  These functions are not
> part of the default /etc/init.d/functions script, which is provided by
> oe-core's lsb pkg.  Append these two missing commands to
> /etc/init.d/functions during the install phase.
>
> Signed-off-by: Paul Barrette <paul.barrette@windriver.com>
> ---
>   recipes-core/initscripts/initscripts_1.0.bbappend | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/recipes-core/initscripts/initscripts_1.0.bbappend b/recipes-core/initscripts/initscripts_1.0.bbappend
> index 04d848d..02b5bc4 100644
> --- a/recipes-core/initscripts/initscripts_1.0.bbappend
> +++ b/recipes-core/initscripts/initscripts_1.0.bbappend
> @@ -7,4 +7,10 @@ do_install_append() {
>   	echo failure \(\) \{  >> ${D}${sysconfdir}/init.d/functions
>   	echo \ \ \ \ echo \$* >> ${D}${sysconfdir}/init.d/functions
>   	echo \}               >> ${D}${sysconfdir}/init.d/functions
> +	echo warning \(\) \{  >> ${D}${sysconfdir}/init.d/functions
> +	echo \ \ \ \ echo \$* >> ${D}${sysconfdir}/init.d/functions
> +	echo \}               >> ${D}${sysconfdir}/init.d/functions
> +	echo begin \(\) \{  >> ${D}${sysconfdir}/init.d/functions

You didn't go the extra mile and line up that new ">>" !! :)

I've run into these myself, and actually hacked the initscript to avoid
issues .. but I like this better. So I'm just going to go ahead and merge
this right away.

Bruce



> +	echo \ \ \ \ echo \$* >> ${D}${sysconfdir}/init.d/functions
> +	echo \}
>   }


