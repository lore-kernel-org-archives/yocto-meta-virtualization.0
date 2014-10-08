Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 57AD4E00876; Tue,  7 Oct 2014 20:37:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.217.175 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6487CE0084F
	for <meta-virtualization@yoctoproject.org>;
	Tue,  7 Oct 2014 20:37:42 -0700 (PDT)
Received: by mail-lb0-f175.google.com with SMTP id u10so7213333lbd.20
	for <meta-virtualization@yoctoproject.org>;
	Tue, 07 Oct 2014 20:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=k0BbaOCQSBIvR4rQdO5RBiuxz3WOCi9iIvEf7SLQsGI=;
	b=gV+yxnEBuTIJCkeSDMEJDjjW8TV+liZ1AvAcSgJBMxpx8/r0f8wbYwnNhOaup5R8W0
	qAGIwPrYF/IN0WdZhlCyu+mMfeg8wjiy5eYRFLurcI/ovOLzVc0xS7w3g/k3XrS19cZO
	gwg8/hSbwh+Zf7cE7EVoNufUy0VnqedQ57Ku96zSkzd5xMGixRNvm1VOV31eqYQljkFK
	25PAP6b8fvhTGvHAKtFrZBE6muDt24RLZlX8bok5EpJfLbj3dE+s6ifZDZEie+Ce7Vwb
	Q4Te1/jAPHJrYlKh7hjYaFJCvKmE+852OHX935qH7tpo04olzpkOIxeIacXF6Ic+qHGQ
	zXLQ==
MIME-Version: 1.0
X-Received: by 10.152.26.200 with SMTP id n8mr8223780lag.57.1412739460064;
	Tue, 07 Oct 2014 20:37:40 -0700 (PDT)
Received: by 10.112.44.234 with HTTP; Tue, 7 Oct 2014 20:37:40 -0700 (PDT)
In-Reply-To: <1412714029-19190-1-git-send-email-zibo.zhao@windriver.com>
References: <1412714029-19190-1-git-send-email-zibo.zhao@windriver.com>
Date: Tue, 7 Oct 2014 23:37:40 -0400
Message-ID: <CADkTA4OYL+-U05BmzBXnj=j+NrBWku7ag777KgEPuUtJ_wU2HA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Zibo Zhao <zibo.zhao@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2] libvirtd not properly shutting down on oVirt node install
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
X-List-Received-Date: Wed, 08 Oct 2014 03:37:50 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 7, 2014 at 4:33 PM, Zibo Zhao <zibo.zhao@windriver.com> wrote:
> From: Prateek Kumar <prateek.kumar@windriver.com>
>
> On registering the ovirt node form the ovirt engine web
> interface the ovirt node installation goes fine but the
> node will suffer a "communication failure" and the
> status of the node will fail to go up status.
> Its due to the race condition in libvirtd shutdown where
> pid file is deleted before the real libvirtd process get
> terminated.
> The issue is fixed by making sure the libvirtd process
> is terminated before deteting the pid file and providing

"deleting"

> sufficient delay.
>

What's the difference between the two patches that came out hours apart ?
Also, can we make these lines closer to 72 chars long .. it makes the log easier
to read.

... and finally, while that is a fine description of the problem, it
is talking about
packages that we don't have in meta-virt. So I'd like the log to just
describe the
race, and the fix, and drop the oVirt parts.

> Signed-off-by: Prateek Kumar <prateek.kumar@windriver.com>
> Signed-off-by: Zibo Zhao <zibo.zhao@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt/libvirtd.sh | 36 +++++++++++++++++++++-------
>  1 file changed, 28 insertions(+), 8 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt/libvirtd.sh b/recipes-extended/libvirt/libvirt/libvirtd.sh
> index b4fa674..beb77ec 100755
> --- a/recipes-extended/libvirt/libvirt/libvirtd.sh
> +++ b/recipes-extended/libvirt/libvirt/libvirtd.sh
> @@ -9,6 +9,8 @@
>
>  . /etc/init.d/functions
>
> +PID=/var/run/libvirtd.pid
> +
>  if [ -f /lib/lsb/init-functions ]
>  then
>      . /lib/lsb/init-functions
> @@ -72,24 +74,42 @@ fi
>
>  case "$1" in
>          start)
> -                if [ -e /var/run/libvirtd.pid ]; then
> -                        if [ -d /proc/$(cat /var/run/libvirtd.pid) ]; then
> +                if [ -e $PID ]; then
> +                        if [ -d /proc/$(cat $PID) ]; then
>                                  echo "virtualization library already started; not starting."
>                          else
> -                                echo "Removing stale PID file /var/run/libvirtd.pid."
> -                                rm -f /var/run/libvirtd.pid
> +                                echo "Removing stale PID file $PID."
> +                                rm -f $PID

The switch to using $PID really looks like it should be a separate patch. Since
is has nothing to do with the race condition fix.

>                          fi
>                  fi
>                  log_begin_msg "Starting virtualization library daemon: libvirtd"
>                  start-stop-daemon -K -x /usr/bin/dnsmasq
> -               start-stop-daemon --start --quiet --pidfile /var/run/libvirtd.pid --exec /usr/sbin/libvirtd -- --daemon --listen
> +                start-stop-daemon --start --quiet --pidfile $PID --exec /usr/sbin/libvirtd -- --daemon --listen
>                  log_end_msg $?
>                  ;;
>          stop)
> +                if [ -f $PID ]; then
> +                        libvirtd_pid=$(cat $PID)
> +                fi
>                  log_begin_msg "Stopping virtualization library daemon: libvirtd"
> -               start-stop-daemon --stop --quiet --retry 3 --exec /usr/sbin/libvirtd --pidfile /var/run/libvirtd.pid
> -                log_end_msg $?
> -                rm -f /var/run/libvirtd.pid
> +                start-stop-daemon --stop --quiet --retry 3 --exec /usr/sbin/libvirtd --pidfile $PID
> +                CHECK=0
> +                K=0
> +                if [ "x$libvirtd_pid" != "x" ]; then
> +                        while /bin/kill -0 $libvirtd_pid >/dev/null 2>&1; do

we shouldn't hardcode /bin/kill.

Bruce

> +                               K=$(($K+1))
> +                               sleep 1
> +                               if [ $K -ge 60 ]; then
> +                                       log_end_msg "Stopping libvirtd: timed out"
> +                                       CHECK=1
> +                                       break
> +                               fi
> +                        done
> +                fi
> +                if [ $CHECK -eq 0 ]; then
> +                        log_end_msg "Removing pid file $PID"
> +                        rm -f $PID
> +                fi
>                  ;;
>          restart)
>                  $0 stop
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

