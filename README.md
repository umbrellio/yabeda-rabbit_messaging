# Yabeda::RabbitMessaging

Built-in metrics for [TableSync](https://github.com/umbrellio/table_sync) out of the box!
Patch [rabbit_messaging](https://github.com/umbrellio/rabbit_messaging) gem.
Works through [Yabeda Framework](https://github.com/yabeda-rb).

## Installation

```ruby
gem "rabbit_messaging"
gem "table_sync"
...
gem "yabeda-rabbit_messaging"
```

And then execute:

```sh
  $ bundle
```

After application launch gem patch `Rabbit::Receiving::Job` class to collect the metrics.

## Metrics

Metrics representing state of TableSync receiving jobs processing:

- Total number of executed jobs: `rabbit_messages_total` (segmented by `exchange`, `routing_key` and `success` status)
- Duration of executed jobs: `rabbit_messages_duration` (segmented by `exchange`, `routing_key` and `success` status)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/umbrellio/table_sync.

## License

Released under MIT License.

## Authors

Team Umbrellio

---

<a href="https://github.com/umbrellio/">
<img style="float: left;" src="https://umbrellio.github.io/Umbrellio/supported_by_umbrellio.svg" alt="Supported by Umbrellio" width="439" height="72">
</a>
