Return-Path: <ml@embed.me.uk>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EB682E00FFC; Wed,  7 Sep 2016 03:36:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [91.82.101.43 listed in list.dnswl.org]
X-Greylist: delayed 1882 seconds by postgrey-1.32 at yocto-www;
	Wed, 07 Sep 2016 03:36:52 PDT
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 41B9FE00A16
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 Sep 2016 03:36:52 -0700 (PDT)
To: meta-virtualization@yoctoproject.org
References: <1473235798-3525-1-git-send-email-jianchuan.wang@windriver.com>
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <834c4425-d897-4086-d8f7-35ff10f8607c@embed.me.uk>
Date: Wed, 7 Sep 2016 11:05:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1473235798-3525-1-git-send-email-jianchuan.wang@windriver.com>
Subject: Re: [PATCH 1/3] protobuf: uprev 3.0.0 from 2.6.1
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
X-List-Received-Date: Wed, 07 Sep 2016 10:36:55 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


On 07/09/16 09:09, jianchuan.wang@windriver.com wrote:
> From: Jianchuan Wang <jianchuan.wang@windriver.com>
>
> Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
> ---
>  .../criu/protobuf-native_2.6.1.bb                  | 21 -----
>  .../criu/protobuf-native_3.0.0.bb                  | 21 +++++
>  .../recipes-containers/criu/protobuf_2.6.1.bb      | 97 ----------------------
>  .../recipes-containers/criu/protobuf_3.0.0.bb      | 97 ++++++++++++++++++++++
>  4 files changed, 118 insertions(+), 118 deletions(-)
>  delete mode 100644 meta-virtualization/recipes-containers/criu/protobuf-native_2.6.1.bb
>  create mode 100644 meta-virtualization/recipes-containers/criu/protobuf-native_3.0.0.bb
>  delete mode 100644 meta-virtualization/recipes-containers/criu/protobuf_2.6.1.bb
>  create mode 100644 meta-virtualization/recipes-containers/criu/protobuf_3.0.0.bb
>
 >
 > <snip>

Is there a reason not to use and update the version is meta-oe? Why the 
duplication?

