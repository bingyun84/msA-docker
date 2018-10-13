package com.idig8.user.thrift;

import com.idig8.thrift.user.UserService;
import org.apache.thrift.TProcessor;
import org.apache.thrift.protocol.TBinaryProtocol;
import org.apache.thrift.server.TNonblockingServer;
import org.apache.thrift.server.TServer;
import org.apache.thrift.transport.TFramedTransport;
import org.apache.thrift.transport.TNonblockingServerSocket;
import org.apache.thrift.transport.TTransportException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;


@Configuration
public class ThriftServer {

    @Value("${service.port}")
    private int servicePort;

    @Autowired
    private UserService.Iface userService;

    @PostConstruct
    public void startThriftServer() {

        // 处理器
        TProcessor processor = new UserService.Processor<>(userService);

        // 传输通道 - 非阻塞方式
        TNonblockingServerSocket socket = null;
        try {
            socket = new TNonblockingServerSocket(servicePort);
        } catch (TTransportException e) {
            e.printStackTrace();
        }
        // 异步IO，需要使用TFramedTransport，它将分块缓存读取。
        TNonblockingServer.Args args = new TNonblockingServer.Args(socket);
        args.processor(processor);

        args.transportFactory(new TFramedTransport.Factory());
        // 使用高密度二进制协议
        args.protocolFactory(new TBinaryProtocol.Factory());

        // 使用非阻塞式IO，服务端和客户端需要指定TFramedTransport数据传输的方式
        TServer server = new TNonblockingServer(args);
        // 启动服务
        server.serve();
    }
}
