Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3A276E00EB0; Tue, 31 May 2016 10:29:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 005EBE00DD0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 31 May 2016 10:29:49 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4VHTmbQ003191
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 31 May 2016 10:29:48 -0700
Received: from server.local (128.224.21.46) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 31 May 2016 10:29:47 -0700
To: <jackie.huang@windriver.com>
References: <1464678510-29698-1-git-send-email-jackie.huang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <0f44f704-b1a9-1b53-382f-4d208a31b62a@windriver.com>
Date: Tue, 31 May 2016 13:29:47 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <1464678510-29698-1-git-send-email-jackie.huang@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] spice: add PACKAGECONFIG for xinerama
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
X-List-Received-Date: Tue, 31 May 2016 17:29:52 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-05-31 3:08 AM, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> spice auto detect Xinerama library to enable the feature,
> but it causes error when using sstate between different
> builds, e.g. previous build have xinerama but the later
> one doesn't, then it fails on the later one with:
>
> "Package 'xinerama', required by 'spice-server', not found"
>
> Add PACKAGECONFIG for xinerama to ensure we have
> deterministic builds.

merged.

Bruce

>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  recipes-support/spice/spice_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-support/spice/spice_git.bb b/recipes-support/spice/spice_git.bb
> index 95f7156..0524c27 100644
> --- a/recipes-support/spice/spice_git.bb
> +++ b/recipes-support/spice/spice_git.bb
> @@ -53,6 +53,7 @@ PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl,"
>  PACKAGECONFIG[client] = "--enable-client,--disable-client,,"
>  PACKAGECONFIG[gui] = "--enable-gui,--disable-gui,,"
>  PACKAGECONFIG[opengl] = "--enable-opengl,--disable-opengl,,"
> +PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama,"
>
>  PACKAGES =+ "${PN}-protocol"
>  LICENSE_${PN}-protocol = "BSD"
>


