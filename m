Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D30E7E0DF
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 20:05:39 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3881.1770667532215533465
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Feb 2026 12:05:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OJoC8FhC;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8c70c6b2bcaso517889585a.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Feb 2026 12:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770667531; x=1771272331; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3a8QyOF8KrDMdWd3XW6h9OCH17fZOekmhY+W2P70zGo=;
        b=OJoC8FhCx/lvI54d6C4CpJFowgE96NtW/WelaligYcdYCTL4l0KUfpgCoWuAjImVEF
         Qvf0ezKtaL+MPw2GtTdH1MsEnnKtNgoqAHAl7Vadnf1nomCTWEA7iiB8HgTNIxlXXXWy
         PtwRm4HqN7bCtg0frQdVrMGDcaNAxbkiykPaHCrbTn+y1Kxm+ArvgKKL/Ebgdcw+LvJs
         2bzyEe9MZVh+Bj69+v5dyb27qygXZVSWUcbEQ6SJ2IdTrWMdg0QobwsuqtJu376HDAsX
         b/NPbxaBy+SDBBD1IEJuBiwPN8uoWmZQmJje6kkr3lRn3/1XZkCx7Zq9Pd7VlizciGJ8
         hdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770667531; x=1771272331;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3a8QyOF8KrDMdWd3XW6h9OCH17fZOekmhY+W2P70zGo=;
        b=UTkPKIdeTPGX6MRSmx7skN2wxH5IzKuOP9aEILubLvyKWVoAp07hDtp0B6XJpQettM
         X3go8xv5SlJUeIkjbdlCKXI3fOAYsP+bkmCcNTaTY7sbaZztSlortmZiUHTK5zLFPkkV
         ARUoREE77UU+eBPREJvv4E41ffDdeT/rFeatauTsCu8tWi1kUdExX0uL4xits4l+rgq3
         5TeNwuVkHEQtfY+xlbNEIe6VKyMgOJq4FSUlbGgTg2ThYl58brRdblXjzBnn3Y61QhRb
         M7BAtHtBeXJ1hNtaW7/a0lnGeRk9VDEqVlrDgPEc8Pv/r7K22//m3ICq+QFOuPKj0v3k
         AgXQ==
X-Gm-Message-State: AOJu0YyED/JqOnR1jBFyayYpnsLK2CaCxfJ4n/qYVkDX4EYkdVDlIn/u
	DB+woT0SD7jxh/NyOfp/5SvElQShJWoyuLtr3nIPev9nCqMhJ17lBnmj
X-Gm-Gg: AZuq6aIkZ/BLUkgEoRN16N7T9IYBiT+qPk6LQniihIBmHxUDfsyUvLVVhFy8+BELkhj
	WFZLbr98jPH9ZyrYatXXTPhURKBJZ46ujkBgMA15ba5etzl2sFSBQWhdeXVjX9Kxd7E78cdenP2
	xpLTBXjDQbaeF+uN7l+vKjXO0v8xOlNSDZdTeVweZSkGDp83Q053wZn3bWTI25Rz5IYWlcVJONt
	CJ+3J6tYmC2r+EXGgaf/iDWDY0PdCddsKHlGXa9YSWJ/lVeM33728OAzGJ9cmXOxZTXxUegG+C/
	eW6oLW4NiIebPzJZsiV/D3589rEsQtNSBaIxt1YIK4dcLF9MafeZ2lEeqT6QP3x9ONZQ1oQWT2t
	dAZFLz4eYyVGStsU8FjTsBHOqOU5n3ObVgwi8KpGm8RHwPdDGNMJvO6E/yLWCwea2knryFbS2Nq
	yIwJ2JGU9AcaTNkvupKvuvr6ch9bD+o8s+GFf5TmPOwGrt5nECOwR9sJGsLNPW2thtP2tU1N1t8
	pwn2iGiUUubYle/AZjw0mCu
X-Received: by 2002:a05:620a:46a1:b0:8b2:e069:690a with SMTP id af79cd13be357-8caf15efcb2mr1499928985a.68.1770667530787;
        Mon, 09 Feb 2026 12:05:30 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf7aed2e7sm874950685a.12.2026.02.09.12.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 12:05:30 -0800 (PST)
Date: Mon, 9 Feb 2026 20:05:28 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: hprajapati@mvista.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][scarthgap][PATCH] docker-moby: Fix
 CVE-2024-29018
Message-ID: <aYo-CF80BvglmUCe@gmail.com>
References: <20260112060705.193801-1-hprajapati@mvista.com>
 <CADkTA4NDWsCm2pVoLpfi-DtAX+i7eyR5M+d27rzUAT_WV-peTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADkTA4NDWsCm2pVoLpfi-DtAX+i7eyR5M+d27rzUAT_WV-peTA@mail.gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Feb 2026 20:05:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9570

and it is merged.

Bruce

In message: Re: [meta-virtualization][scarthgap][PATCH] docker-moby: Fix CVE-2024-29018
on 04/02/2026 Bruce Ashfield wrote:

> Sorry for the delay, this will be merged shortly.
> 
> Bruce
> 
> On Mon, Jan 12, 2026 at 1:07 AM Hitendra Prajapati via
> lists.yoctoproject.org <hprajapati=mvista.com@lists.yoctoproject.org> wrote:
> 
> > Upstream-Status: Backport from
> > https://github.com/moby/moby/commit/e63daec8672d77ac0b2b5c262ef525c7cf17fd20
> >
> > Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> > ---
> >  recipes-containers/docker/docker-moby_git.bb  |   1 +
> >  .../docker/files/CVE-2024-29018.patch         | 344 ++++++++++++++++++
> >  2 files changed, 345 insertions(+)
> >  create mode 100644 recipes-containers/docker/files/CVE-2024-29018.patch
> >
> > diff --git a/recipes-containers/docker/docker-moby_git.bb
> > b/recipes-containers/docker/docker-moby_git.bb
> > index d274b002..1331930e 100644
> > --- a/recipes-containers/docker/docker-moby_git.bb
> > +++ b/recipes-containers/docker/docker-moby_git.bb
> > @@ -58,6 +58,7 @@ SRC_URI = "\
> >
> >  file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=src/import \
> >          file://CVE-2024-36620.patch;patchdir=src/import \
> >          file://CVE-2024-36621.patch;patchdir=src/import \
> > +        file://CVE-2024-29018.patch;patchdir=src/import \
> >         "
> >
> >  DOCKER_COMMIT = "${SRCREV_moby}"
> > diff --git a/recipes-containers/docker/files/CVE-2024-29018.patch
> > b/recipes-containers/docker/files/CVE-2024-29018.patch
> > new file mode 100644
> > index 00000000..f3c800ff
> > --- /dev/null
> > +++ b/recipes-containers/docker/files/CVE-2024-29018.patch
> > @@ -0,0 +1,344 @@
> > +From 20c205fd3a0081d005958eff690e2b34df1c5e5e Mon Sep 17 00:00:00 2001
> > +From: Rob Murray <rob.murray@docker.com>
> > +Date: Tue, 19 Mar 2024 11:19:30 +0000
> > +Subject: [PATCH 1/2] Environment variable to override resolv.conf path.
> > +
> > +If env var DOCKER_TEST_RESOLV_CONF_PATH is set, treat it as an override
> > +for the 'resolv.conf' path.
> > +
> > +Added as part of resolv.conf refactoring, but needed by back-ported test
> > +TestInternalNetworkDNS.
> > +
> > +Signed-off-by: Rob Murray <rob.murray@docker.com>
> > +
> > +CVE: CVE-2024-29018
> > +Upstream-Status: Backport [
> > https://github.com/moby/moby/commit/e63daec8672d77ac0b2b5c262ef525c7cf17fd20
> > ]
> > +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> > +---
> > + daemon/container_operations_unix.go       |  20 +--
> > + integration/networking/resolvconf_test.go | 142 ++++++++++++++++++++++
> > + libnetwork/endpoint.go                    |  12 +-
> > + libnetwork/resolver.go                    |  17 ++-
> > + libnetwork/sandbox_dns_unix.go            |   9 +-
> > + 5 files changed, 182 insertions(+), 18 deletions(-)
> > + create mode 100644 integration/networking/resolvconf_test.go
> > +
> > +diff --git a/daemon/container_operations_unix.go
> > b/daemon/container_operations_unix.go
> > +index 6a23a4ca92..e9be1b4e72 100644
> > +--- a/daemon/container_operations_unix.go
> > ++++ b/daemon/container_operations_unix.go
> > +@@ -380,6 +380,7 @@ func serviceDiscoveryOnDefaultNetwork() bool {
> > +
> > + func setupPathsAndSandboxOptions(container *container.Container, cfg
> > *config.Config, sboxOptions *[]libnetwork.SandboxOption) error {
> > +       var err error
> > ++      var originResolvConfPath string
> > +
> > +       // Set the correct paths for /etc/hosts and /etc/resolv.conf,
> > based on the
> > +       // networking-mode of the container. Note that containers with
> > "container"
> > +@@ -393,8 +394,8 @@ func setupPathsAndSandboxOptions(container
> > *container.Container, cfg *config.Con
> > +               *sboxOptions = append(
> > +                       *sboxOptions,
> > +                       libnetwork.OptionOriginHostsPath("/etc/hosts"),
> > +-
> > libnetwork.OptionOriginResolvConfPath("/etc/resolv.conf"),
> > +               )
> > ++              originResolvConfPath = "/etc/resolv.conf"
> > +       case container.HostConfig.NetworkMode.IsUserDefined():
> > +               // The container uses a user-defined network. We use the
> > embedded DNS
> > +               // server for container name resolution and to act as a
> > DNS forwarder
> > +@@ -407,10 +408,7 @@ func setupPathsAndSandboxOptions(container
> > *container.Container, cfg *config.Con
> > +               // If systemd-resolvd is used, the "upstream" DNS servers
> > can be found in
> > +               // /run/systemd/resolve/resolv.conf. We do not query those
> > DNS servers
> > +               // directly, as they can be dynamically reconfigured.
> > +-              *sboxOptions = append(
> > +-                      *sboxOptions,
> > +-
> > libnetwork.OptionOriginResolvConfPath("/etc/resolv.conf"),
> > +-              )
> > ++              originResolvConfPath = "/etc/resolv.conf"
> > +       default:
> > +               // For other situations, such as the default bridge
> > network, container
> > +               // discovery / name resolution is handled through
> > /etc/hosts, and no
> > +@@ -423,11 +421,15 @@ func setupPathsAndSandboxOptions(container
> > *container.Container, cfg *config.Con
> > +               // DNS servers on the host can be dynamically updated.
> > +               //
> > +               // Copy the host's resolv.conf for the container
> > (/run/systemd/resolve/resolv.conf or /etc/resolv.conf)
> > +-              *sboxOptions = append(
> > +-                      *sboxOptions,
> > +-
> > libnetwork.OptionOriginResolvConfPath(cfg.GetResolvConf()),
> > +-              )
> > ++              originResolvConfPath = cfg.GetResolvConf()
> > ++      }
> > ++
> > ++      // Allow tests to point at their own resolv.conf file.
> > ++      if envPath := os.Getenv("DOCKER_TEST_RESOLV_CONF_PATH"); envPath
> > != "" {
> > ++              log.G(context.TODO()).Infof("Using OriginResolvConfPath
> > from env: %s", envPath)
> > ++              originResolvConfPath = envPath
> > +       }
> > ++      *sboxOptions = append(*sboxOptions,
> > libnetwork.OptionOriginResolvConfPath(originResolvConfPath))
> > +
> > +       container.HostsPath, err = container.GetRootResourcePath("hosts")
> > +       if err != nil {
> > +diff --git a/integration/networking/resolvconf_test.go
> > b/integration/networking/resolvconf_test.go
> > +new file mode 100644
> > +index 0000000000..60c8b1bc9a
> > +--- /dev/null
> > ++++ b/integration/networking/resolvconf_test.go
> > +@@ -0,0 +1,142 @@
> > ++package networking
> > ++
> > ++import (
> > ++      "net"
> > ++      "os"
> > ++      "testing"
> > ++
> > ++      containertypes "github.com/docker/docker/api/types/container"
> > ++      "github.com/docker/docker/integration/internal/container"
> > ++      "github.com/docker/docker/integration/internal/network"
> > ++      "github.com/docker/docker/testutil/daemon"
> > ++      "github.com/miekg/dns"
> > ++      "gotest.tools/v3/assert"
> > ++      is "gotest.tools/v3/assert/cmp"
> > ++      "gotest.tools/v3/skip"
> > ++)
> > ++
> > ++// writeTempResolvConf writes a resolv.conf that only contains a single
> > ++// nameserver line, with address addr.
> > ++// It returns the name of the temp file.
> > ++func writeTempResolvConf(t *testing.T, addr string) string {
> > ++      t.Helper()
> > ++      // Not using t.TempDir() here because in rootless mode, while the
> > temporary
> > ++      // directory gets mode 0777, it's a subdir of an 0700 directory
> > owned by root.
> > ++      // So, it's not accessible by the daemon.
> > ++      f, err := os.CreateTemp("", "resolv.conf")
> > ++      assert.NilError(t, err)
> > ++      t.Cleanup(func() { os.Remove(f.Name()) })
> > ++      err = f.Chmod(0644)
> > ++      assert.NilError(t, err)
> > ++      f.Write([]byte("nameserver " + addr + "\n"))
> > ++      return f.Name()
> > ++}
> > ++
> > ++const dnsRespAddr = "10.11.12.13"
> > ++
> > ++// startDaftDNS starts and returns a really, really daft DNS server that
> > only
> > ++// responds to type-A requests, and always with address dnsRespAddr.
> > ++func startDaftDNS(t *testing.T, addr string) *dns.Server {
> > ++      serveDNS := func(w dns.ResponseWriter, query *dns.Msg) {
> > ++              if query.Question[0].Qtype == dns.TypeA {
> > ++                      resp := &dns.Msg{}
> > ++                      resp.SetReply(query)
> > ++                      answer := &dns.A{
> > ++                              Hdr: dns.RR_Header{
> > ++                                      Name:   query.Question[0].Name,
> > ++                                      Rrtype: dns.TypeA,
> > ++                                      Class:  dns.ClassINET,
> > ++                                      Ttl:    600,
> > ++                              },
> > ++                      }
> > ++                      answer.A = net.ParseIP(dnsRespAddr)
> > ++                      resp.Answer = append(resp.Answer, answer)
> > ++                      _ = w.WriteMsg(resp)
> > ++              }
> > ++      }
> > ++
> > ++      conn, err := net.ListenUDP("udp", &net.UDPAddr{
> > ++              IP:   net.ParseIP(addr),
> > ++              Port: 53,
> > ++      })
> > ++      assert.NilError(t, err)
> > ++
> > ++      server := &dns.Server{Handler: dns.HandlerFunc(serveDNS),
> > PacketConn: conn}
> > ++      go func() {
> > ++              _ = server.ActivateAndServe()
> > ++      }()
> > ++
> > ++      return server
> > ++}
> > ++
> > ++// Check that when a container is connected to an internal network, DNS
> > ++// requests sent to daemon's internal DNS resolver are not forwarded to
> > ++// an upstream resolver listening on a localhost address.
> > ++// (Assumes the host does not already have a DNS server on 127.0.0.1.)
> > ++func TestInternalNetworkDNS(t *testing.T) {
> > ++      skip.If(t, testEnv.DaemonInfo.OSType == "windows", "No resolv.conf
> > on Windows")
> > ++      skip.If(t, testEnv.IsRootless, "Can't use resolver on host in
> > rootless mode")
> > ++      ctx := setupTest(t)
> > ++
> > ++      // Start a DNS server on the loopback interface.
> > ++      server := startDaftDNS(t, "127.0.0.1")
> > ++      defer server.Shutdown()
> > ++
> > ++      // Set up a temp resolv.conf pointing at that DNS server, and a
> > daemon using it.
> > ++      tmpFileName := writeTempResolvConf(t, "127.0.0.1")
> > ++      d := daemon.New(t,
> > daemon.WithEnvVars("DOCKER_TEST_RESOLV_CONF_PATH="+tmpFileName))
> > ++      d.StartWithBusybox(ctx, t, "--experimental", "--ip6tables")
> > ++      defer d.Stop(t)
> > ++
> > ++      c := d.NewClientT(t)
> > ++      defer c.Close()
> > ++
> > ++      intNetName := "intnet"
> > ++      network.CreateNoError(ctx, t, c, intNetName,
> > ++              network.WithDriver("bridge"),
> > ++              network.WithInternal(),
> > ++      )
> > ++      defer network.RemoveNoError(ctx, t, c, intNetName)
> > ++
> > ++      extNetName := "extnet"
> > ++      network.CreateNoError(ctx, t, c, extNetName,
> > ++              network.WithDriver("bridge"),
> > ++      )
> > ++      defer network.RemoveNoError(ctx, t, c, extNetName)
> > ++
> > ++      // Create a container, initially with external connectivity.
> > ++      // Expect the external DNS server to respond to a request from the
> > container.
> > ++      ctrId := container.Run(ctx, t, c,
> > container.WithNetworkMode(extNetName))
> > ++      defer c.ContainerRemove(ctx, ctrId,
> > containertypes.RemoveOptions{Force: true})
> > ++      res, err := container.Exec(ctx, c, ctrId, []string{"nslookup",
> > "test.example"})
> > ++      assert.NilError(t, err)
> > ++      assert.Check(t, is.Equal(res.ExitCode, 0))
> > ++      assert.Check(t, is.Contains(res.Stdout(), dnsRespAddr))
> > ++
> > ++      // Connect the container to the internal network as well.
> > ++      // External DNS should still be used.
> > ++      err = c.NetworkConnect(ctx, intNetName, ctrId, nil)
> > ++      assert.NilError(t, err)
> > ++      res, err = container.Exec(ctx, c, ctrId, []string{"nslookup",
> > "test.example"})
> > ++      assert.NilError(t, err)
> > ++      assert.Check(t, is.Equal(res.ExitCode, 0))
> > ++      assert.Check(t, is.Contains(res.Stdout(), dnsRespAddr))
> > ++
> > ++      // Disconnect from the external network.
> > ++      // Expect no access to the external DNS.
> > ++      err = c.NetworkDisconnect(ctx, extNetName, ctrId, true)
> > ++      assert.NilError(t, err)
> > ++      res, err = container.Exec(ctx, c, ctrId, []string{"nslookup",
> > "test.example"})
> > ++      assert.NilError(t, err)
> > ++      assert.Check(t, is.Equal(res.ExitCode, 1))
> > ++      assert.Check(t, is.Contains(res.Stdout(), "SERVFAIL"))
> > ++
> > ++      // Reconnect the external network.
> > ++      // Check that the external DNS server is used again.
> > ++      err = c.NetworkConnect(ctx, extNetName, ctrId, nil)
> > ++      assert.NilError(t, err)
> > ++      res, err = container.Exec(ctx, c, ctrId, []string{"nslookup",
> > "test.example"})
> > ++      assert.NilError(t, err)
> > ++      assert.Check(t, is.Equal(res.ExitCode, 0))
> > ++      assert.Check(t, is.Contains(res.Stdout(), dnsRespAddr))
> > ++}
> > +diff --git a/libnetwork/endpoint.go b/libnetwork/endpoint.go
> > +index d9c257dc68..3ca546a4ac 100644
> > +--- a/libnetwork/endpoint.go
> > ++++ b/libnetwork/endpoint.go
> > +@@ -538,8 +538,13 @@ func (ep *Endpoint) sbJoin(sb *Sandbox, options
> > ...EndpointOption) (err error) {
> > +               return sb.setupDefaultGW()
> > +       }
> > +
> > +-      moveExtConn := sb.getGatewayEndpoint() != extEp
> > ++      currentExtEp := sb.getGatewayEndpoint()
> > ++      // Enable upstream forwarding if the sandbox gained external
> > connectivity.
> > ++      if sb.resolver != nil {
> > ++              sb.resolver.SetForwardingPolicy(currentExtEp != nil)
> > ++      }
> > +
> > ++      moveExtConn := currentExtEp != extEp
> > +       if moveExtConn {
> > +               if extEp != nil {
> > +                       log.G(context.TODO()).Debugf("Revoking external
> > connectivity on endpoint %s (%s)", extEp.Name(), extEp.ID())
> > +@@ -735,6 +740,11 @@ func (ep *Endpoint) sbLeave(sb *Sandbox, force bool,
> > options ...EndpointOption)
> > +
> > +       // New endpoint providing external connectivity for the sandbox
> > +       extEp = sb.getGatewayEndpoint()
> > ++      // Disable upstream forwarding if the sandbox lost external
> > connectivity.
> > ++      if sb.resolver != nil {
> > ++              sb.resolver.SetForwardingPolicy(extEp != nil)
> > ++      }
> > ++
> > +       if moveExtConn && extEp != nil {
> > +               log.G(context.TODO()).Debugf("Programming external
> > connectivity on endpoint %s (%s)", extEp.Name(), extEp.ID())
> > +               extN, err := extEp.getNetworkFromStore()
> > +diff --git a/libnetwork/resolver.go b/libnetwork/resolver.go
> > +index 9df2154499..5d5686fc86 100644
> > +--- a/libnetwork/resolver.go
> > ++++ b/libnetwork/resolver.go
> > +@@ -9,6 +9,7 @@ import (
> > +       "strconv"
> > +       "strings"
> > +       "sync"
> > ++      "sync/atomic"
> > +       "time"
> > +
> > +       "github.com/containerd/log"
> > +@@ -75,7 +76,7 @@ type Resolver struct {
> > +       tcpListen     *net.TCPListener
> > +       err           error
> > +       listenAddress string
> > +-      proxyDNS      bool
> > ++      proxyDNS      atomic.Bool
> > +       startCh       chan struct{}
> > +       logger        *log.Entry
> > +
> > +@@ -85,15 +86,17 @@ type Resolver struct {
> > +
> > + // NewResolver creates a new instance of the Resolver
> > + func NewResolver(address string, proxyDNS bool, backend DNSBackend)
> > *Resolver {
> > +-      return &Resolver{
> > ++      r := &Resolver{
> > +               backend:       backend,
> > +-              proxyDNS:      proxyDNS,
> > +               listenAddress: address,
> > +               err:           fmt.Errorf("setup not done yet"),
> > +               startCh:       make(chan struct{}, 1),
> > +               fwdSem:        semaphore.NewWeighted(maxConcurrent),
> > +               logInverval:   rate.Sometimes{Interval: logInterval},
> > +       }
> > ++      r.proxyDNS.Store(proxyDNS)
> > ++
> > ++      return r
> > + }
> > +
> > + func (r *Resolver) log(ctx context.Context) *log.Entry {
> > +@@ -194,6 +197,12 @@ func (r *Resolver) SetExtServers(extDNS
> > []extDNSEntry) {
> > +       }
> > + }
> > +
> > ++// SetForwardingPolicy re-configures the embedded DNS resolver to either
> > enable or disable forwarding DNS queries to
> > ++// external servers.
> > ++func (r *Resolver) SetForwardingPolicy(policy bool) {
> > ++      r.proxyDNS.Store(policy)
> > ++}
> > ++
> > + // NameServer returns the IP of the DNS resolver for the containers.
> > + func (r *Resolver) NameServer() string {
> > +       return r.listenAddress
> > +@@ -421,7 +430,7 @@ func (r *Resolver) serveDNS(w dns.ResponseWriter,
> > query *dns.Msg) {
> > +               return
> > +       }
> > +
> > +-      if r.proxyDNS {
> > ++      if r.proxyDNS.Load() {
> > +               // If the user sets ndots > 0 explicitly and the query is
> > +               // in the root domain don't forward it out. We will return
> > +               // failure and let the client retry with the search domain
> > +diff --git a/libnetwork/sandbox_dns_unix.go
> > b/libnetwork/sandbox_dns_unix.go
> > +index e30f394057..9f7a1c4671 100644
> > +--- a/libnetwork/sandbox_dns_unix.go
> > ++++ b/libnetwork/sandbox_dns_unix.go
> > +@@ -30,10 +30,11 @@ const (
> > + func (sb *Sandbox) startResolver(restore bool) {
> > +       sb.resolverOnce.Do(func() {
> > +               var err error
> > +-              // The embedded resolver is always started with proxyDNS
> > set as true, even when the sandbox is only attached to
> > +-              // an internal network. This way, it's the driver
> > responsibility to make sure `connect` syscall fails fast when
> > +-              // no external connectivity is available (eg. by not
> > setting a default gateway).
> > +-              sb.resolver = NewResolver(resolverIPSandbox, true, sb)
> > ++              // The resolver is started with proxyDNS=false if the
> > sandbox does not currently
> > ++              // have a gateway. So, if the Sandbox is only connected to
> > an 'internal' network,
> > ++              // it will not forward DNS requests to external resolvers.
> > The resolver's
> > ++              // proxyDNS setting is then updated as network Endpoints
> > are added/removed.
> > ++              sb.resolver = NewResolver(resolverIPSandbox,
> > sb.getGatewayEndpoint() != nil, sb)
> > +               defer func() {
> > +                       if err != nil {
> > +                               sb.resolver = nil
> > +--
> > +2.50.1
> > +
> > --
> > 2.50.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#9548):
> > https://lists.yoctoproject.org/g/meta-virtualization/message/9548
> > Mute This Topic: https://lists.yoctoproject.org/mt/117219699/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> > bruce.ashfield@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
> >
> 
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II

